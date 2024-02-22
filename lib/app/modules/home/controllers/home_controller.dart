import 'package:deep_dive_get_cli/app/data/model/post_model.dart';
import 'package:deep_dive_get_cli/app/data/model/story_model.dart';
import 'package:deep_dive_get_cli/app/modules/message/controllers/message_controller.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final storyController = StoryController();
  final messageController = MessageController();

  PostModel postModel = PostModel(
    namaAkun: 'falahrazhibr',
    description:
        'Username Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor lorem ipsum dolor sit amet, consectetur adip',
    fotoProfile: 'falah_profile',
    jumlahLike: 1,
    isLike: false,
    postingGambar: 'germany',
    isSponsor: false,
    isBookmark: false,
  );

  List<StoryModel> storyModel = [];
  @override
  void onInit() {
    loadStoryModel();
    super.onInit();
  }

  void loadStoryModel() {
    storyModel = [
      StoryModel(
        image: 'foto_profile',
        namaAkun: 'Your Story',
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title:
                "\"Believe you can and you're halfway there.\" - Theodore Roosevelt",
            backgroundColor: Colors.red,
          ),
        ],
        isLoginAccount: true,
      ),
      StoryModel(
        image: 'azziz_profile',
        namaAkun: 'azzlhrr_',
        storyItems: [
          StoryItem.text(
            title:
                "\"The only way to do great work is to love what you do.\" - Steve Jobs",
            backgroundColor: Colors.blue,
          ),
          StoryItem.pageImage(
            url: faker.image.image(random: true, height: 1000),
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.text(
            title:
                "\"Success is not final, failure is not fatal: It is the courage to continue that counts.\" - Winston Churchill",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      StoryModel(
        image: 'dika_profile',
        namaAkun: 'mhndkptrr',
        storyItems: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: "Still sampling",
            controller: storyController,
          ),
        ],
      ),
      StoryModel(
        image: 'falah_profile',
        namaAkun: 'falahrazhibr',
        storyItems: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: "Still sampling",
            controller: storyController,
          ),
        ],
      ),
      StoryModel(
        image: 'rapli_profile',
        namaAkun: 'raplii121',
        storyItems: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: "Still sampling",
            controller: storyController,
          ),
        ],
      ),
      StoryModel(
        image: 'irham_profile',
        namaAkun: '_hm.n.tr_',
        storyItems: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: "Still sampling",
            controller: storyController,
          ),
        ],
      ),
      StoryModel(
        image: 'blank_profile',
        namaAkun: 'fazari.razka',
        storyItems: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: "Still sampling",
            controller: storyController,
          ),
        ],
      ),
      StoryModel(
        image: 'blank_profile',
        namaAkun: 'billy_0305',
        storyItems: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: "Still sampling",
            controller: storyController,
          ),
        ],
      ),
    ];
    update();
  }

  void changeIconLike() {
    postModel.isLike = !postModel.isLike;
    if (postModel.isLike) {
      postModel.jumlahLike++;
    } else {
      postModel.jumlahLike--;
    }
    update();
  }

  void changeIconBookmark() {
    postModel.isBookmark = !postModel.isBookmark;
    update();
  }

  void toStoryPageView(
    List<StoryItem>? storyItems,
  ) {
    Get.toNamed(Routes.SNAP_GRAM, arguments: {
      'story': storyItems,
    });
  }

  void toNotificationPageView() {
    Get.toNamed(Routes.NOTIFICATION);
  }

  void toEditProfileView() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  void toMessageView() {
    Get.toNamed(Routes.MESSAGE);
  }

  void toHomeView() {
    Get.back();
  }

  void toProfileNewFollowing() {
    Get.toNamed(Routes.PROFILE_NEW_FOLLOWING);
  }
}
