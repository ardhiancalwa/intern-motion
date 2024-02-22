import 'package:get/get.dart';

import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/grid_post/bindings/grid_post_binding.dart';
import '../modules/grid_post/views/grid_post_view.dart';
import '../modules/highlight_story/bindings/highlight_story_binding.dart';
import '../modules/highlight_story/views/highlight_story_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/message/bindings/message_binding.dart';
import '../modules/message/views/message_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile_new_following/bindings/profile_new_following_binding.dart';
import '../modules/profile_new_following/views/profile_new_following_view.dart';

import '../modules/snap_gram/bindings/snap_gram_binding.dart';
import '../modules/snap_gram/views/snap_gram_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SNAP_GRAM,
      page: () => const SnapGramView(),
      binding: SnapGramBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.HIGHLIGHT_STORY,
      page: () => const HighlightStoryView(),
      binding: HighlightStoryBinding(),
    ),
    GetPage(
      name: _Paths.GRID_POST,
      page: () => GridPostView(),
      binding: GridPostBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => const MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_NEW_FOLLOWING,
      page: () => ProfileNewFollowingView(),
      binding: ProfileNewFollowingBinding(),
    ),
  ];
}
