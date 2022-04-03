part of '../home_view.dart';

extension Title on HomeView {
  Text title(BuildContext context, int index, HomeCubit read) {
    return Text(read.model?[index].place ?? "");
  }
}
