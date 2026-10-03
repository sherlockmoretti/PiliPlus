// This is a generated file - do not edit.
//
// Generated from bilibili/app/playerunite/playerunite.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'package:protobuf/well_known_types/google/protobuf/any.pbjson.dart'
    as $1;

import 'package:PiliPlus/grpc/bilibili/playershared.pbjson.dart' as $0;

@$core.Deprecated('Use playHalfChannelsReplyDescriptor instead')
const PlayHalfChannelsReply$json = {
  '1': 'PlayHalfChannelsReply',
  '2': [
    {
      '1': 'groups',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.bilibili.playershared.SettingGroup',
      '10': 'groups'
    },
  ],
};

/// Descriptor for `PlayHalfChannelsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playHalfChannelsReplyDescriptor = $convert.base64Decode(
    'ChVQbGF5SGFsZkNoYW5uZWxzUmVwbHkSOwoGZ3JvdXBzGAEgAygLMiMuYmlsaWJpbGkucGxheW'
    'Vyc2hhcmVkLlNldHRpbmdHcm91cFIGZ3JvdXBz');

@$core.Deprecated('Use playHalfChannelsReqDescriptor instead')
const PlayHalfChannelsReq$json = {
  '1': 'PlayHalfChannelsReq',
  '2': [
    {'1': 'aid', '3': 1, '4': 1, '5': 3, '10': 'aid'},
    {'1': 'cid', '3': 2, '4': 1, '5': 3, '10': 'cid'},
    {
      '1': 'extra_content',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.bilibili.app.playerunite.v1.PlayHalfChannelsReq.ExtraContentEntry',
      '10': 'extraContent'
    },
    {'1': 'from_scene', '3': 4, '4': 1, '5': 9, '10': 'fromScene'},
  ],
  '3': [PlayHalfChannelsReq_ExtraContentEntry$json],
};

@$core.Deprecated('Use playHalfChannelsReqDescriptor instead')
const PlayHalfChannelsReq_ExtraContentEntry$json = {
  '1': 'ExtraContentEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PlayHalfChannelsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playHalfChannelsReqDescriptor = $convert.base64Decode(
    'ChNQbGF5SGFsZkNoYW5uZWxzUmVxEhAKA2FpZBgBIAEoA1IDYWlkEhAKA2NpZBgCIAEoA1IDY2'
    'lkEmcKDWV4dHJhX2NvbnRlbnQYAyADKAsyQi5iaWxpYmlsaS5hcHAucGxheWVydW5pdGUudjEu'
    'UGxheUhhbGZDaGFubmVsc1JlcS5FeHRyYUNvbnRlbnRFbnRyeVIMZXh0cmFDb250ZW50Eh0KCm'
    'Zyb21fc2NlbmUYBCABKAlSCWZyb21TY2VuZRo/ChFFeHRyYUNvbnRlbnRFbnRyeRIQCgNrZXkY'
    'ASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use playViewUniteReplyDescriptor instead')
const PlayViewUniteReply$json = {
  '1': 'PlayViewUniteReply',
  '2': [
    {
      '1': 'vod_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.VodInfo',
      '10': 'vodInfo'
    },
    {
      '1': 'play_arc_conf',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.PlayArcConf',
      '10': 'playArcConf'
    },
    {
      '1': 'play_device_conf',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.PlayDeviceConf',
      '10': 'playDeviceConf'
    },
    {
      '1': 'event',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.Event',
      '10': 'event'
    },
    {
      '1': 'supplement',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'supplement'
    },
    {
      '1': 'play_arc',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.PlayArc',
      '10': 'playArc'
    },
    {
      '1': 'qn_trial_info',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.QnTrialInfo',
      '10': 'qnTrialInfo'
    },
    {
      '1': 'history',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.History',
      '10': 'history'
    },
    {
      '1': 'view_info',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.ViewInfo',
      '10': 'viewInfo'
    },
    {
      '1': 'fragment_video',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.FragmentVideo',
      '10': 'fragmentVideo'
    },
    {
      '1': 'video_ctrl',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.VideoCtrl',
      '10': 'videoCtrl'
    },
  ],
};

/// Descriptor for `PlayViewUniteReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playViewUniteReplyDescriptor = $convert.base64Decode(
    'ChJQbGF5Vmlld1VuaXRlUmVwbHkSOQoIdm9kX2luZm8YASABKAsyHi5iaWxpYmlsaS5wbGF5ZX'
    'JzaGFyZWQuVm9kSW5mb1IHdm9kSW5mbxJGCg1wbGF5X2FyY19jb25mGAIgASgLMiIuYmlsaWJp'
    'bGkucGxheWVyc2hhcmVkLlBsYXlBcmNDb25mUgtwbGF5QXJjQ29uZhJPChBwbGF5X2RldmljZV'
    '9jb25mGAMgASgLMiUuYmlsaWJpbGkucGxheWVyc2hhcmVkLlBsYXlEZXZpY2VDb25mUg5wbGF5'
    'RGV2aWNlQ29uZhIyCgVldmVudBgEIAEoCzIcLmJpbGliaWxpLnBsYXllcnNoYXJlZC5FdmVudF'
    'IFZXZlbnQSNAoKc3VwcGxlbWVudBgFIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlSCnN1cHBs'
    'ZW1lbnQSOQoIcGxheV9hcmMYBiABKAsyHi5iaWxpYmlsaS5wbGF5ZXJzaGFyZWQuUGxheUFyY1'
    'IHcGxheUFyYxJGCg1xbl90cmlhbF9pbmZvGAcgASgLMiIuYmlsaWJpbGkucGxheWVyc2hhcmVk'
    'LlFuVHJpYWxJbmZvUgtxblRyaWFsSW5mbxI4CgdoaXN0b3J5GAggASgLMh4uYmlsaWJpbGkucG'
    'xheWVyc2hhcmVkLkhpc3RvcnlSB2hpc3RvcnkSPAoJdmlld19pbmZvGAkgASgLMh8uYmlsaWJp'
    'bGkucGxheWVyc2hhcmVkLlZpZXdJbmZvUgh2aWV3SW5mbxJLCg5mcmFnbWVudF92aWRlbxgKIA'
    'EoCzIkLmJpbGliaWxpLnBsYXllcnNoYXJlZC5GcmFnbWVudFZpZGVvUg1mcmFnbWVudFZpZGVv'
    'Ej8KCnZpZGVvX2N0cmwYCyABKAsyIC5iaWxpYmlsaS5wbGF5ZXJzaGFyZWQuVmlkZW9DdHJsUg'
    'l2aWRlb0N0cmw=');

@$core.Deprecated('Use playViewUniteReqDescriptor instead')
const PlayViewUniteReq$json = {
  '1': 'PlayViewUniteReq',
  '2': [
    {
      '1': 'vod',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.VideoVod',
      '10': 'vod'
    },
    {'1': 'spmid', '3': 2, '4': 1, '5': 9, '10': 'spmid'},
    {'1': 'from_spmid', '3': 3, '4': 1, '5': 9, '10': 'fromSpmid'},
    {
      '1': 'extra_content',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.bilibili.app.playerunite.v1.PlayViewUniteReq.ExtraContentEntry',
      '10': 'extraContent'
    },
    {'1': 'bvid', '3': 5, '4': 1, '5': 9, '10': 'bvid'},
    {'1': 'ad_extra', '3': 6, '4': 1, '5': 9, '10': 'adExtra'},
    {
      '1': 'fragment',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.bilibili.playershared.Fragment',
      '10': 'fragment'
    },
    {'1': 'from_scene', '3': 8, '4': 1, '5': 9, '10': 'fromScene'},
    {
      '1': 'play_ctrl',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.bilibili.playershared.PlayCtrl',
      '10': 'playCtrl'
    },
  ],
  '3': [PlayViewUniteReq_ExtraContentEntry$json],
};

@$core.Deprecated('Use playViewUniteReqDescriptor instead')
const PlayViewUniteReq_ExtraContentEntry$json = {
  '1': 'ExtraContentEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `PlayViewUniteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playViewUniteReqDescriptor = $convert.base64Decode(
    'ChBQbGF5Vmlld1VuaXRlUmVxEjEKA3ZvZBgBIAEoCzIfLmJpbGliaWxpLnBsYXllcnNoYXJlZC'
    '5WaWRlb1ZvZFIDdm9kEhQKBXNwbWlkGAIgASgJUgVzcG1pZBIdCgpmcm9tX3NwbWlkGAMgASgJ'
    'Uglmcm9tU3BtaWQSZAoNZXh0cmFfY29udGVudBgEIAMoCzI/LmJpbGliaWxpLmFwcC5wbGF5ZX'
    'J1bml0ZS52MS5QbGF5Vmlld1VuaXRlUmVxLkV4dHJhQ29udGVudEVudHJ5UgxleHRyYUNvbnRl'
    'bnQSEgoEYnZpZBgFIAEoCVIEYnZpZBIZCghhZF9leHRyYRgGIAEoCVIHYWRFeHRyYRI7Cghmcm'
    'FnbWVudBgHIAEoCzIfLmJpbGliaWxpLnBsYXllcnNoYXJlZC5GcmFnbWVudFIIZnJhZ21lbnQS'
    'HQoKZnJvbV9zY2VuZRgIIAEoCVIJZnJvbVNjZW5lEjwKCXBsYXlfY3RybBgJIAEoDjIfLmJpbG'
    'liaWxpLnBsYXllcnNoYXJlZC5QbGF5Q3RybFIIcGxheUN0cmwaPwoRRXh0cmFDb250ZW50RW50'
    'cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

const $core.Map<$core.String, $core.dynamic> PlayerServiceBase$json = {
  '1': 'Player',
  '2': [
    {
      '1': 'PlayHalfChannels',
      '2': '.bilibili.app.playerunite.v1.PlayHalfChannelsReq',
      '3': '.bilibili.app.playerunite.v1.PlayHalfChannelsReply'
    },
    {
      '1': 'PlayViewUnite',
      '2': '.bilibili.app.playerunite.v1.PlayViewUniteReq',
      '3': '.bilibili.app.playerunite.v1.PlayViewUniteReply'
    },
  ],
};

@$core.Deprecated('Use playerServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    PlayerServiceBase$messageJson = {
  '.bilibili.app.playerunite.v1.PlayHalfChannelsReq': PlayHalfChannelsReq$json,
  '.bilibili.app.playerunite.v1.PlayHalfChannelsReq.ExtraContentEntry':
      PlayHalfChannelsReq_ExtraContentEntry$json,
  '.bilibili.app.playerunite.v1.PlayHalfChannelsReply':
      PlayHalfChannelsReply$json,
  '.bilibili.playershared.SettingGroup': $0.SettingGroup$json,
  '.bilibili.playershared.SettingItem': $0.SettingItem$json,
  '.bilibili.playershared.SettingBase': $0.SettingBase$json,
  '.bilibili.playershared.SettingControl': $0.SettingControl$json,
  '.bilibili.playershared.SettingBase.ReportEntry':
      $0.SettingBase_ReportEntry$json,
  '.bilibili.playershared.SettingMore': $0.SettingMore$json,
  '.bilibili.app.playerunite.v1.PlayViewUniteReq': PlayViewUniteReq$json,
  '.bilibili.playershared.VideoVod': $0.VideoVod$json,
  '.bilibili.app.playerunite.v1.PlayViewUniteReq.ExtraContentEntry':
      PlayViewUniteReq_ExtraContentEntry$json,
  '.bilibili.playershared.Fragment': $0.Fragment$json,
  '.bilibili.playershared.FragmentInfo': $0.FragmentInfo$json,
  '.google.protobuf.Any': $1.Any$json,
  '.bilibili.app.playerunite.v1.PlayViewUniteReply': PlayViewUniteReply$json,
  '.bilibili.playershared.VodInfo': $0.VodInfo$json,
  '.bilibili.playershared.Stream': $0.Stream$json,
  '.bilibili.playershared.StreamInfo': $0.StreamInfo$json,
  '.bilibili.playershared.StreamLimit': $0.StreamLimit$json,
  '.bilibili.playershared.Scheme': $0.Scheme$json,
  '.bilibili.playershared.DashVideo': $0.DashVideo$json,
  '.bilibili.playershared.SegmentVideo': $0.SegmentVideo$json,
  '.bilibili.playershared.ResponseUrl': $0.ResponseUrl$json,
  '.bilibili.playershared.DashItem': $0.DashItem$json,
  '.bilibili.playershared.DolbyItem': $0.DolbyItem$json,
  '.bilibili.playershared.VolumeInfo': $0.VolumeInfo$json,
  '.bilibili.playershared.VolumeInfo.MultiSceneArgsEntry':
      $0.VolumeInfo_MultiSceneArgsEntry$json,
  '.bilibili.playershared.LossLessItem': $0.LossLessItem$json,
  '.bilibili.playershared.PlayArcConf': $0.PlayArcConf$json,
  '.bilibili.playershared.PlayArcConf.ArcConfsEntry':
      $0.PlayArcConf_ArcConfsEntry$json,
  '.bilibili.playershared.ArcConf': $0.ArcConf$json,
  '.bilibili.playershared.ExtraContent': $0.ExtraContent$json,
  '.bilibili.playershared.PlayDeviceConf': $0.PlayDeviceConf$json,
  '.bilibili.playershared.PlayDeviceConf.DeviceConfsEntry':
      $0.PlayDeviceConf_DeviceConfsEntry$json,
  '.bilibili.playershared.DeviceConf': $0.DeviceConf$json,
  '.bilibili.playershared.ConfValue': $0.ConfValue$json,
  '.bilibili.playershared.Event': $0.Event$json,
  '.bilibili.playershared.Shake': $0.Shake$json,
  '.bilibili.playershared.QnTip': $0.QnTip$json,
  '.bilibili.playershared.PlayArc': $0.PlayArc$json,
  '.bilibili.playershared.Interaction': $0.Interaction$json,
  '.bilibili.playershared.Node': $0.Node$json,
  '.bilibili.playershared.Dimension': $0.Dimension$json,
  '.bilibili.playershared.QnTrialInfo': $0.QnTrialInfo$json,
  '.bilibili.playershared.Toast': $0.Toast$json,
  '.bilibili.playershared.Button': $0.Button$json,
  '.bilibili.playershared.Button.ReportParamsEntry':
      $0.Button_ReportParamsEntry$json,
  '.bilibili.playershared.History': $0.History$json,
  '.bilibili.playershared.HistoryInfo': $0.HistoryInfo$json,
  '.bilibili.playershared.ViewInfo': $0.ViewInfo$json,
  '.bilibili.playershared.ViewInfo.DialogMapEntry':
      $0.ViewInfo_DialogMapEntry$json,
  '.bilibili.playershared.Dialog': $0.Dialog$json,
  '.bilibili.playershared.BackgroundInfo': $0.BackgroundInfo$json,
  '.bilibili.playershared.TextInfo': $0.TextInfo$json,
  '.bilibili.playershared.ImageInfo': $0.ImageInfo$json,
  '.bilibili.playershared.ButtonInfo': $0.ButtonInfo$json,
  '.bilibili.playershared.BadgeInfo': $0.BadgeInfo$json,
  '.bilibili.playershared.GradientColor': $0.GradientColor$json,
  '.bilibili.playershared.Report': $0.Report$json,
  '.bilibili.playershared.ButtonInfo.OrderReportParamsEntry':
      $0.ButtonInfo_OrderReportParamsEntry$json,
  '.bilibili.playershared.TaskParam': $0.TaskParam$json,
  '.bilibili.playershared.BottomDisplay': $0.BottomDisplay$json,
  '.bilibili.playershared.ExtData': $0.ExtData$json,
  '.bilibili.playershared.PlayListInfo': $0.PlayListInfo$json,
  '.bilibili.playershared.PlayList': $0.PlayList$json,
  '.bilibili.playershared.Banner': $0.Banner$json,
  '.bilibili.playershared.EpInlineVideoInfo': $0.EpInlineVideoInfo$json,
  '.bilibili.playershared.EpInlineVideo': $0.EpInlineVideo$json,
  '.bilibili.playershared.ChargingExt': $0.ChargingExt$json,
  '.bilibili.playershared.Dialog.ConditionsEntry':
      $0.Dialog_ConditionsEntry$json,
  '.bilibili.playershared.PromptBar': $0.PromptBar$json,
  '.bilibili.playershared.BenefitInfo': $0.BenefitInfo$json,
  '.bilibili.playershared.ComprehensiveToast': $0.ComprehensiveToast$json,
  '.bilibili.playershared.ComprehensiveToast.OrderReportParamsEntry':
      $0.ComprehensiveToast_OrderReportParamsEntry$json,
  '.bilibili.playershared.PayWallOnshowAction': $0.PayWallOnshowAction$json,
  '.bilibili.playershared.PayWallOnshowAction.OrderReportParamsEntry':
      $0.PayWallOnshowAction_OrderReportParamsEntry$json,
  '.bilibili.playershared.ExpSwitch': $0.ExpSwitch$json,
  '.bilibili.playershared.FullPromptBar': $0.FullPromptBar$json,
  '.bilibili.playershared.FoldData': $0.FoldData$json,
  '.bilibili.playershared.CountDownItem': $0.CountDownItem$json,
  '.bilibili.playershared.FragmentVideo': $0.FragmentVideo$json,
  '.bilibili.playershared.FragmentVideoInfo': $0.FragmentVideoInfo$json,
  '.bilibili.playershared.VideoCtrl': $0.VideoCtrl$json,
  '.bilibili.playershared.AutoQnCtl': $0.AutoQnCtl$json,
};

/// Descriptor for `Player`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List playerServiceDescriptor = $convert.base64Decode(
    'CgZQbGF5ZXISeAoQUGxheUhhbGZDaGFubmVscxIwLmJpbGliaWxpLmFwcC5wbGF5ZXJ1bml0ZS'
    '52MS5QbGF5SGFsZkNoYW5uZWxzUmVxGjIuYmlsaWJpbGkuYXBwLnBsYXllcnVuaXRlLnYxLlBs'
    'YXlIYWxmQ2hhbm5lbHNSZXBseRJvCg1QbGF5Vmlld1VuaXRlEi0uYmlsaWJpbGkuYXBwLnBsYX'
    'llcnVuaXRlLnYxLlBsYXlWaWV3VW5pdGVSZXEaLy5iaWxpYmlsaS5hcHAucGxheWVydW5pdGUu'
    'djEuUGxheVZpZXdVbml0ZVJlcGx5');
