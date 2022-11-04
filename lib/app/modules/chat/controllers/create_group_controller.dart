import 'package:exceed_resources_frontend/app/modules/core/controllers/app_controller.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_m_model.dart';
import 'package:exceed_resources_frontend/app/modules/misc/models/colleague_status_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CreateGroupController extends AppController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final searchFocus = FocusNode();
  final colleagues = Rx<List<MColleagueM>>([
    MColleagueM(
      positionName: 'Frontend Developer',
      id: 'emp_1',
      name: 'Myo Thiha Aung',
      status: ColleagueStatusM(
        name: 'In A Meeting',
        until: DateTime.now().add(const Duration(hours: 2)),
        color: Colors.orangeAccent,
      ),
      image:
          'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
    ),
    MColleagueM(
      positionName: 'Backend Developer',
      id: 'emp_2',
      name: 'Phyo Ko Ko',
      status: ColleagueStatusM(
        name: 'Lunch',
        until: DateTime.now().add(const Duration(hours: 1)),
        color: Colors.purpleAccent,
      ),
      image:
          'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
    ),
    MColleagueM(
      positionName: 'UI/UX Developer',
      id: 'emp_3',
      name: 'Lin Lin',
      image:
          'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
    ),
    MColleagueM(
      positionName: '.Net Developer',
      id: 'emp_4',
      name: 'Aung Bo Bo Tun',
      status: ColleagueStatusM(
        name: 'In A Meeting',
        until: DateTime.now().add(const Duration(minutes: 45)),
        color: Colors.yellowAccent,
      ),
      image:
          'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
    ),
    MColleagueM(
      positionName: 'Frontend Developer',
      id: 'emp_5',
      name: 'May Cho',
      image:
          'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_2.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
    ),
    MColleagueM(
      positionName: 'Java Developer',
      id: 'emp_6',
      name: 'Htet Htet',
      status: ColleagueStatusM(
        name: 'In A Meeting',
        until: DateTime.now().add(const Duration(hours: 1)),
        color: Colors.redAccent,
      ),
      image:
          'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_1.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
    ),
    MColleagueM(
      positionName: 'Frontend Developer',
      id: 'emp_7',
      name: 'Htet Aung',
      image:
          'https://firebasestorage.googleapis.com/v0/b/exceed-resources-365004.appspot.com/o/emp_3.jpg?alt=media&token=758555e1-fb5a-4905-84a9-205bad38415a',
    ),
  ]);
  late final participants = Rx<List<MColleagueM>>([]);

  void updateParticipant({required String id, bool add = true}) {
    if (add) {
      participants.value.add(colleagues.value.firstWhere((each) => each.id == id));
      colleagues.value.removeWhere((each) => each.id == id);
    } else {
      colleagues.value.add(participants.value.firstWhere((each) => each.id == id));
      participants.value.removeWhere((each) => each.id == id);
    }
    participants.refresh();
    colleagues.refresh();
  }

  void submitHandler() {}

  @override
  void onClose() {
    searchFocus.dispose();
    nameController.dispose();
    super.onClose();
  }
}
