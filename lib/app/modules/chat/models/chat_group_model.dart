import 'package:exceed_resources_frontend/app/modules/chat/models/chat_conversation_model.dart';
import 'package:exceed_resources_frontend/app/modules/chat/models/chat_detail_model.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/enum.dart';
import 'package:exceed_resources_frontend/app/modules/core/utils/json_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_group_model.freezed.dart';
part 'chat_group_model.g.dart';

@freezed
class MChatGroup with _$MChatGroup {
  factory MChatGroup({
    String? id,
    required String name,
    required String image,
    required EChat type,
    @JsonKey(name: 'chat_conversation')
        required MChatConversation chatConversation,
    @JsonKey(name: 'chat_detail')
        required MChatDetail chatDetail,
    @JsonKey(name: 'num_unread')
        required int numUnread,
    @JsonKey(name: 'last_message')
        required String lastMessage,
    @JsonKey(
      name: 'updated_at',
      fromJson: dateFromJson,
    )
        DateTime? updatedAt,
  }) = _MChatGroup;

  factory MChatGroup.fromJson(Map<String, dynamic> json) => _$MChatGroupFromJson(json);
}
