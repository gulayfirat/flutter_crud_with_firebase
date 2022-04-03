import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/login_cubit.dart';
part './subview/login_button.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset('assets/gifs/googlelogin.gif'),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  context.read<LoginCubit>().login(context);
                },
                child: loginButton(),
              );
            },
          ),
        ]),
      )),
    );
  }
}
