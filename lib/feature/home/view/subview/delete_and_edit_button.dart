part of '../home_view.dart';

extension DeleteAndEditButton on HomeView {
  Container deleteUpdateButton(
      BuildContext context, int index, HomeCubit read) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Row(children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpdateView(
                        model: read.model![index],
                      )),
            );
          },
          child: Icon(
            Icons.edit,
            color: Colors.green,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () => read.delete(read.model?[index].id ?? '', index),
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ]),
    );
  }
}
