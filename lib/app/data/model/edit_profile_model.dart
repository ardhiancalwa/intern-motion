class EditProfileModel {
  String imageProfile;
  String numOfFollowers;
  String numOfFollowing;
  String numOfPosts;
  String nameAccount;
  String username;
  String category;
  String description;
  String hyperlink;
  String hashtag;
  bool isFollow;

  EditProfileModel({
    required this.imageProfile,
    required this.numOfFollowers,
    required this.numOfFollowing,
    required this.numOfPosts,
    required this.nameAccount,
    required this.username,
    required this.category,
    required this.description,
    required this.hyperlink,
    required this.hashtag,
    this.isFollow = false,
  });
}
