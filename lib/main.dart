import 'package:challenge_motion_week_8/app/controllers/auth_controller.dart';
import 'package:challenge_motion_week_8/app/shared/themes/colors.dart';
import 'package:challenge_motion_week_8/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authControler = Get.put(AuthController(), permanent: true);
    return StreamBuilder<User?>(
      stream: authControler.streamStatus,
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snapshot.data != null ? Routes.NAVBAR : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }
        return MaterialApp(
          home: Scaffold(
            backgroundColor: primaryColor,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
