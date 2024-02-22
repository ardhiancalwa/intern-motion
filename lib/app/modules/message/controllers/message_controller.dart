import 'package:deep_dive_get_cli/app/data/model/message_model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  List<MessageModel> messageModel = [];

  @override
  void onInit() {
    loadMessageModel();
    super.onInit();
  }

  void loadMessageModel() {
    messageModel = [
      MessageModel(
        profileImage: 'foto_profile',
        username: 'ardhncalwaa',
        description: 'Sent a reel by kabulastugan',
        isActive: false,
        time: '1h',
      ),
      MessageModel(
        profileImage: 'azziz_profile',
        username: 'azzlhrr',
        description: ' ',
        isActive: true,
        time: '4h',
      ),
      MessageModel(
        profileImage: 'rapli_profile',
        username: 'rapliii121',
        description: '4 new messages',
        isActive: false,
        time: '2d',
      ),
      MessageModel(
        profileImage: 'dika_profile',
        username: 'mhndkptrr',
        description: 'Mentioned you in their comment',
        isActive: false,
        time: '3w',
      ),
      MessageModel(
        profileImage: 'irham_profile',
        username: '_hm.n.tr_',
        description: 'Okayyy',
        isActive: false,
        time: '3w',
      ),
    ];
  }
}
