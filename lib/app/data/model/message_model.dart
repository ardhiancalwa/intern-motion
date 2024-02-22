class MessageModel {
  String profileImage;
  String username;
  String description;
  bool isActive;
  String time;

  MessageModel({
    required this.profileImage,
    required this.username,
    required this.description,
    this.isActive = false,
    required this.time,
  });
}
