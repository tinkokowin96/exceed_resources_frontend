import 'package:exceed_resources_frontend/app/modules/chat/models/chat_message_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_model.freezed.dart';
part 'chat_detail_model.g.dart';

@freezed
class MChatDetail with _$MChatDetail {
  factory MChatDetail({
    @Default('') String id,
    @Default('') String image,
    @Default('') String name,
    @Default('') String description,
    @Default([]) List<MColleague> colleagues,
    @Default([]) @JsonKey(name: 'pin_messages') List<MChatMessage> pinMessages,
    @Default([]) List<MAttachment> attachments,
  }) = _MChatDetail;

  factory MChatDetail.fromJson(Map<String, dynamic> json) => _$MChatDetailFromJson(json);
}
