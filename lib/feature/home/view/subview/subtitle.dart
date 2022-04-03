part of '../home_view.dart';

extension Subtitle on HomeView {
  Column subtitle(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
                "${context.read<HomeCubit>().model?[index].price ?? 0.0} TL - Payment type: "),
            Text(context.read<HomeCubit>().model?[index].paymentType ?? ""),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.0,
        ),
        Text(context.read<HomeCubit>().model?[index].date ?? ""),
      ],
    );
  }
}
