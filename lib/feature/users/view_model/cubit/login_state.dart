part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class LoginCompleted extends LoginState {}

class GetUserById extends LoginState {}
