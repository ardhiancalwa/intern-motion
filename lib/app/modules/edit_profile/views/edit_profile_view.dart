import 'package:deep_dive_get_cli/app/modules/grid_post/views/grid_post_view.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/bottomAppBar.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/user_info.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/user_profile_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';
import '../../../data/model/story_model.dart';

import '../../../shared/widgets/highlight_story.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text(
                controller.userProfile.nameAccount,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                width: 28,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                padding: const EdgeInsets.all(2),
                child: const Center(
                  child: Text(
                    '10+',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_box_outlined),
            ),
            IconButton(
              onPressed: () => controller.changeTheme(),
              icon: const Icon(Icons.dark_mode_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UserProfile(userProfile: controller.userProfile),
              UserInfo(userProfile: controller.userProfile),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                height: 97.75,
                child: ListView.builder(
                  itemCount: controller.highlightStoryModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    StoryModel data2 = controller.highlightStoryModel[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 12,
                      ),
                      child: HighlightStory(
                        highlightStory: data2,
                        onTap: () {
                          controller.toStoryPageView(data2.storyItems);
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
        bottomNavigationBar: const Bottom());
  }
}
