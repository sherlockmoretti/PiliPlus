import 'package:PiliPlus/grpc/bilibili/app/playerunite/playerunite.pb.dart' as unite;
import 'package:PiliPlus/grpc/bilibili/playershared.pb.dart' as shared;
import 'package:PiliPlus/grpc/grpc_req.dart';
import 'package:PiliPlus/http/loading_state.dart';
import 'package:PiliPlus/models/common/video/audio_quality.dart';
import 'package:PiliPlus/models/common/video/video_quality.dart';
import 'package:PiliPlus/models/video/play/url.dart';
import 'package:fixnum/fixnum.dart';

/// APP 端统一播放接口（bilibili.app.playerunite.v1.Player/PlayViewUnite）封装。
///
/// 移植自 BiliRoamingX 的 trial_vip_quality（无限试用会员画质）：
/// - 请求侧：VideoVod 携带 is_need_trial = true（字段号 11），向官方请求会员画质试看流；
/// - 响应侧：解析时有意不读取 qn_trial_info 与 stream_info.need_vip，
///   等效于 BiliRoamingX 的 clearQnTrialInfo() + needVip=false/vipFree=true，
///   即客户端不执行试看时长限制、不将高画质视为大会员专属。
/// 是否下发试看流由 B 站官方接口决定；请求失败或无流时回退调用方原有的 REST 逻辑。
abstract final class PlayerUnite {
  static const _grpcUrl = '/bilibili.app.playerunite.v1.Player/PlayViewUnite';
  static const _spmid = 'united.player-video-detail.0.0';

  /// 请求画质试看流，成功时转换为现有的 PlayUrlModel 供播放器直接消费。
  static Future<LoadingState<PlayUrlModel>> playViewUnite({
    int? aid,
    String? bvid,
    required int cid,
    int? epid,
    required int qn,
  }) async {
    final res = await GrpcReq.request(
      _grpcUrl,
      unite.PlayViewUniteReq(
        vod: shared.VideoVod(
          aid: aid == null || aid == 0 ? null : Int64(aid),
          cid: Int64(cid),
          qn: Int64(qn),
          fnver: 0,
          fnval: 4048,
          fourk: true,
          isNeedTrial: true,
        ),
        spmid: _spmid,
        fromSpmid: 'player.video-detail.0.0',
        bvid: bvid,
        fromScene: 'normal',
        extraContent: [
          if (epid != null) MapEntry('ep_id', '$epid'),
        ],
      ),
      unite.PlayViewUniteReply.fromBuffer,
    );
    if (res case Success(:final response)) {
      final model = _toPlayUrlModel(response);
      if (model != null) {
        return Success(model);
      }
      return const Error('未获取到可用的试看流');
    }
    if (res case Error(:final errMsg, :final code)) {
      return Error(errMsg, code: code);
    }
    return const Error('试看请求失败');
  }

  /// 将 grpc 的 PlayViewUniteReply 转换为 REST 风格的 PlayUrlModel。
  /// 只处理 DASH 流；无视频/音频流时返回 null 由调用方回退。
  static PlayUrlModel? _toPlayUrlModel(unite.PlayViewUniteReply reply) {
    if (!reply.hasVodInfo()) return null;
    final vodInfo = reply.vodInfo;

    final videos = <VideoItem>[];
    final supportFormats = <FormatItem>[];
    final acceptQuality = <int>[];
    final acceptDesc = <String?>[];
    String? acceptFormat;

    for (final shared.Stream stream in vodInfo.streamList) {
      // 与 BiliRoamingX 一致：忽略 info.needVip / info.needLogin，
      // 只要服务器下发了 DASH 流就纳入可选画质。
      if (!stream.hasStreamInfo() || !stream.hasDashVideo()) continue;
      final info = stream.streamInfo;
      final dashVideo = stream.dashVideo;
      final quality = videoQualityFromCode(info.quality);
      if (quality == null) continue;
      videos.add(
        VideoItem(
          id: info.quality,
          baseUrl: dashVideo.baseUrl,
          backupUrl: dashVideo.backupUrl.toList(),
          bandWidth: dashVideo.bandwidth,
          width: dashVideo.width,
          height: dashVideo.height,
          frameRate: dashVideo.frameRate,
          codecid: dashVideo.codecid,
          quality: quality,
        ),
      );
      acceptQuality.add(info.quality);
      acceptDesc.add(info.newDescription);
      acceptFormat ??= info.format;
      supportFormats.add(
        FormatItem(
          quality: info.quality,
          format: info.format,
          newDesc: info.newDescription,
          displayDesc: info.displayDesc,
        ),
      );
    }
    if (videos.isEmpty) return null;

    final audios = <AudioItem>[
      for (final audio in vodInfo.dashAudio)
        if (audioQualityFromCode(audio.id) != null) _audioItemFromDash(audio),
      if (vodInfo.hasDolby())
        for (final audio in vodInfo.dolby.audio)
          if (audioQualityFromCode(audio.id) != null)
            _audioItemFromDash(audio),
      if (vodInfo.hasLossLessItem() &&
          audioQualityFromCode(vodInfo.lossLessItem.audio.id) != null)
        _audioItemFromDash(vodInfo.lossLessItem.audio),
    ];
    if (audios.isEmpty) return null;

    return PlayUrlModel(
      from: 'unite',
      result: 'suee',
      quality: vodInfo.quality,
      format: vodInfo.format,
      timeLength: vodInfo.timelength.toInt(),
      acceptFormat: acceptFormat,
      acceptDesc: acceptDesc,
      acceptQuality: acceptQuality,
      videoCodecid: vodInfo.videoCodecid,
      dash: Dash(
        duration: vodInfo.timelength.toInt() ~/ 1000,
        video: videos,
        audio: audios,
      ),
      supportFormats: supportFormats,
    );
  }

  static AudioItem _audioItemFromDash(shared.DashItem audio) =>
      AudioItem.fromJson({
        'id': audio.id,
        'baseUrl': audio.baseUrl,
        'backup_url': audio.backupUrl,
      });

  static VideoQuality? videoQualityFromCode(int code) {
    for (final quality in VideoQuality.values) {
      if (quality.code == code) return quality;
    }
    return null;
  }

  static AudioQuality? audioQualityFromCode(int code) {
    for (final quality in AudioQuality.values) {
      if (quality.code == code) return quality;
    }
    return null;
  }
}
