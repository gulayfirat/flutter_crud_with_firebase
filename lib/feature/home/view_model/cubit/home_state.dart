part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class Completed extends HomeState {
  List<Model>? model;
  Completed({
    this.model,
  });
}

class DeleteData extends HomeState {}
