import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../controllers/snap_gram_controller.dart';

class SnapGramView extends GetView<SnapGramController> {
  const SnapGramView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoryView(
      controller: controller.storyController,
      storyItems: controller.listOfStory,
      onComplete: controller.snapGramComplete,
    ));
  }
}
