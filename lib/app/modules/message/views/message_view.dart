import 'package:deep_dive_get_cli/app/data/model/message_model.dart';
import 'package:deep_dive_get_cli/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/bottomAppBar.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/message_widget.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditProfileController editProfileController = EditProfileController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              editProfileController.userProfile.nameAccount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call_outlined,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.border_color_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldGetX(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Message",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Requests",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.messageModel.length,
                itemBuilder: (context, index) {
                  MessageModel data = controller.messageModel[index];
                  return Message(
                    messageModel: data,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Bottom(),
    );
  }
}
