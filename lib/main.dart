import 'package:flutter/material.dart';
import 'package:interview_project/core/locale/locale_manager.dart';
import 'package:interview_project/feature/home/view/home_view.dart';
import 'package:interview_project/feature/users/view/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interview_project/product/utils/cache/cache_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CacheManager.getStringData(PreferencesKey.userUID) != null
          ? HomeView()
          : LoginView(),
    );
  }
}
