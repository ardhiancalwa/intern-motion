import 'package:deep_dive_get_cli/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/bottomAppBar.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/highlight_story.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/user_new_follow.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/user_profile_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/story_model.dart';
import '../../grid_post/views/grid_post_view.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/profile_new_following_controller.dart';

class ProfileNewFollowingView extends GetView<ProfileNewFollowingController> {
  final HomeController homeController = HomeController();
  final EditProfileController editProfileController = EditProfileController();
  ProfileNewFollowingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => homeController.toHomeView(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
        ),
        title: Text(
          controller.userProfile.nameAccount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserProfile(userProfile: controller.userProfile),
            UserNewFollow(userProfile: controller.userProfile),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              height: 97.75,
              child: ListView.builder(
                itemCount: controller.highlightStoryModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  StoryModel data = controller.highlightStoryModel[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: HighlightStory(
                      highlightStory: data,
                      onTap: () {
                        controller.toStoryPageView(data.storyItems);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Expanded(
                flex: 1,
                child: GridPostView(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottom(),
    );
  }
}
