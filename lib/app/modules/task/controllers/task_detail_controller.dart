import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/attachment_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mixins/message_input_mixin.dart';
import 'package:exceed_resources_frontend/app/modules/core/mock/attachment.dart';
import 'package:exceed_resources_frontend/app/modules/core/models/attachment_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/controllers/task_table_controller.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/priority_model.dart';
import 'package:exceed_resources_frontend/app/modules/task/models/status_model.dart';
import 'package:get/get.dart';

class TaskDetailController extends AppController with AttachmentMixin, MessageInputMixin {
  final tableController = Get.find<TaskTableController>();
  late final task = tableController.selectedTask.value;
  final statuses = Rx<List<MStatus>>([]);
  final priorities = Rx<List<MPriority>>([]);
  final attachments = Rx<List<MAttachment>>(m_attachments);

  void updateStatus() {}
  void updatePriority() {}
  void updateComment() {}

  @override
  Future<void> updateMessageAttachment({String? name}) async {
    final updatedAttachments = await updateAttachment(
      attachments: messageAttachments.value,
      name: name,
    );
    if (updatedAttachments != null) {
      messageAttachments.value = updatedAttachments;
      messageAttachments.refresh();
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
