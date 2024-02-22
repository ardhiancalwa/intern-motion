import 'package:deep_dive_get_cli/app/data/model/notification_model.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/bottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/notification_widget.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.notificationModel.length,
          itemBuilder: (context, index) {
            NotificationModel data = controller.notificationModel[index];
            return MyNotification(
              notificationModel: data,
            );
          },
        ),
      ),
      bottomNavigationBar: const Bottom(),
    );
  }
}


