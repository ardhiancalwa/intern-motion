import 'package:flutter/material.dart';

import '../../data/model/message_model.dart';

class Message extends StatelessWidget {
  final MessageModel messageModel;
  const Message({
    super.key,
    required this.messageModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: AssetImage(
              'assets/images/profile/${messageModel.profileImage}.jpg'),
        ),
      ),
      title: Text(
        messageModel.username,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: messageModel.isActive
          ? Text(
              'Active ${messageModel.time} ago',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            )
          : Text(
              messageModel.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.camera_alt_outlined,
        ),
      ),
    );
  }
}
