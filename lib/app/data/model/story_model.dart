import 'package:story_view/story_view.dart';

class StoryModel {
  String namaAkun;
  String image;
  List<StoryItem>? storyItems;
  bool isLoginAccount;

  StoryModel({
    required this.namaAkun,
    required this.image,
    this.storyItems,
    this.isLoginAccount = false,
  });
}
