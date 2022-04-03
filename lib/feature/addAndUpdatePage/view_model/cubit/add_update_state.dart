part of 'add_update_cubit.dart';

@immutable
abstract class AddAndUpdateState {}

class AddInitial extends AddAndUpdateState {}

class AddonChange extends AddAndUpdateState {}

class AddDataCompleted extends AddAndUpdateState {}

class TransactionModel extends AddAndUpdateState {}
