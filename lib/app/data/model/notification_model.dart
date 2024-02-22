class NotificationModel {
  String nameAccount;
  String description;
  String time;
  String image;
  bool isFollow;

  NotificationModel({
    required this.nameAccount,
    required this.description,
    required this.time,
    required this.image,
    this.isFollow = true,
  });
}
