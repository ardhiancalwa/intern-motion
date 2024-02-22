import 'package:flutter/material.dart';
import '../../data/model/notification_model.dart';

class MyNotification extends StatelessWidget {
  final NotificationModel notificationModel;
  const MyNotification({
    super.key,
    required this.notificationModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: AssetImage(
              'assets/images/profile/${notificationModel.image}.jpg'),
        ),
      ),
      title: Text(
        notificationModel.nameAccount,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: RichText(
        text: TextSpan(
          text: '${notificationModel.description}  ',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          children: [
            TextSpan(
              text: notificationModel.time,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      trailing: notificationModel.isFollow
          ? SizedBox(
              width: 95,
              height: 35,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Follow",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
