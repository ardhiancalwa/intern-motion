import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../controllers/highlight_story_controller.dart';

class HighlightStoryView extends GetView<HighlightStoryController> {
  const HighlightStoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        controller: controller.highlightStoryController,
        storyItems: controller.listOfHighlightStory,
        onComplete: controller.HighlightStoryComplete,
      ),
    );
  }
}
