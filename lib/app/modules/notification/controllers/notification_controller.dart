import 'package:get/get.dart';
import '../../../data/model/notification_model.dart';

class NotificationController extends GetxController {
  List<NotificationModel> notificationModel = [];
  @override
  void onInit() {
    loadNotificationModel();
    super.onInit();
  }

  void loadNotificationModel() {
    notificationModel = [
      NotificationModel(
        nameAccount: 'rapliii121',
        description: 'lorem ipsum dolor sit amet, consectetur adipiscing',
        time: '1h',
        image: 'rapli_profile',
        isFollow: false,
      ),
      NotificationModel(
        nameAccount: 'azzlhrr_',
        description: 'lorem ipsum dolor sit amet, consectetur adipiscing',
        time: '8h',
        image: 'azziz_profile',
        isFollow: false,
      ),
      NotificationModel(
        nameAccount: 'hmdkptrr',
        description:
            'lorem ipsum dolor sit amet, consectetur adipiscing lorem ipsum dolor sit amet',
        time: '2d',
        image: 'dika_profile',
        isFollow: false,
      ),
      NotificationModel(
        nameAccount: 'fazari_razka',
        description: 'lorem ipsum dolor sit amet, consectetur adipiscing',
        time: '2d',
        image: 'blank_profile',
        isFollow: true,
      ),
      NotificationModel(
        nameAccount: 'falahrazhibr',
        description:
            'lorem ipsum dolor sit amet, consectetur adipiscing lorem ipsum dolor sit amet',
        time: '3d',
        image: 'falah_profile',
        isFollow: false,
      ),
      NotificationModel(
        nameAccount: 'billy_0305',
        description:
            'lorem ipsum dolor sit amet, consectetur adipiscing lorem ipsum dolor sit amet',
        time: '6d',
        image: 'blank_profile',
        isFollow: true,
      ),
      NotificationModel(
        nameAccount: '_hm.n.tr_',
        description:
            'lorem ipsum dolor sit amet, consectetur adipiscing lorem ipsum dolor sit amet',
        time: '6d',
        image: 'irham_profile',
        isFollow: false,
      ),
    ];
  }
}
