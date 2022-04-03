import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interview_project/product/utils/cache/cache_manager.dart';
import 'package:interview_project/product/utils/firebase/authentication_function.dart';
import '../../../../core/locale/locale_manager.dart';
import '../../../home/view/home_view.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool _isCircular = false;

  void changeIsCircular() {
    _isCircular = !_isCircular;
  }

  Future login(BuildContext context) async {
    changeIsCircular();
    emit(Loading());
    User? user = await AuthenticationFunction().signInWithGoogle();
    changeIsCircular();
    emit(Loading());
    if (user != null) {
      print(user.uid);
      await CacheManager.saveStringData(PreferencesKey.userUID, user.uid);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
          (route) => false);

      emit(LoginCompleted());
    }
  }
}
