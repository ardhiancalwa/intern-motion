import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../../../data/model/edit_profile_model.dart';
import '../../../data/model/story_model.dart';
import '../../../routes/app_pages.dart';

class ProfileNewFollowingController extends GetxController {
  final highlightStoryController = StoryController();

  EditProfileModel userProfile = EditProfileModel(
    imageProfile: 'falah_profile',
    numOfPosts: '234',
    numOfFollowers: '678',
    numOfFollowing: '12',
    nameAccount: 'falahrazhibr',
    username: 'calwa',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    category: 'Category/Genre text',
    hyperlink: 'Link goes here',
    hashtag: '#hastag',
    isFollow: false,
  );

  @override
  void onInit() {
    super.onInit();
    loadHighlightStoryModel();
  }

  List<StoryModel> highlightStoryModel = [];

  void loadHighlightStoryModel() {
    highlightStoryModel = [
      StoryModel(
        image: 'japan',
        namaAkun: 'Japan',
        storyItems: [
          StoryItem.text(
            title: 'Japan',
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: 'Tokyo',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      StoryModel(
        image: 'germany',
        namaAkun: 'Germany',
        storyItems: [
          StoryItem.text(
            title: 'Germany',
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: 'Berlin',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      StoryModel(
        image: 'swiss',
        namaAkun: 'Swiss',
        storyItems: [
          StoryItem.text(
            title: 'Swiss',
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: 'Zurich',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      StoryModel(
        image: 'korea',
        namaAkun: 'Korea',
        storyItems: [
          StoryItem.text(
            title: 'Korea',
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: 'Seoul',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      StoryModel(
        image: 'dubai',
        namaAkun: 'Dubai',
        storyItems: [
          StoryItem.text(
            title: 'Dubai',
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: 'Dubaiii',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    ];
  }

  void toStoryPageView(
    List<StoryItem>? highlightStoryItems,
  ) {
    Get.toNamed(Routes.HIGHLIGHT_STORY, arguments: {
      'highlight_story': highlightStoryItems,
    });
  }
}
