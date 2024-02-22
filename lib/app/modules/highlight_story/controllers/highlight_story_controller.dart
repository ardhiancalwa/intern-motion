import 'package:get/get.dart';
import 'package:story_view/story_view.dart';


class HighlightStoryController extends GetxController {
  final highlightStoryController = StoryController();
  List<StoryItem> listOfHighlightStory = Get.arguments['highlight_story'];
  void HighlightStoryComplete() {
    Get.back();
  }
}
