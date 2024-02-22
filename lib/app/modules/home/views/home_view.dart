import 'package:deep_dive_get_cli/app/shared/widgets/bottomAppBar.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/image_story.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/post_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/model/story_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  'Instagram',
                  style: GoogleFonts.oleoScript(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  controller.toNotificationPageView();
                },
                icon: const Icon(Icons.favorite_border_outlined),
              ),
              IconButton(
                onPressed: () => controller.toMessageView(),
                icon: const Icon(Icons.message_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_box_outlined),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 97.75,
                  child: ListView.builder(
                    itemCount: controller.storyModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      StoryModel data = controller.storyModel[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                        ),
                        child: ImageStory(
                          story: data,
                          onTap: () {
                            controller.toStoryPageView(data.storyItems);
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Post(
                  postModel: controller.postModel,
                  onPressed: controller.changeIconLike,
                  onPressed2: controller.changeIconBookmark,
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          bottomNavigationBar: const Bottom());
    });
  }
}
