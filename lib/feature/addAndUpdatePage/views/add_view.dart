import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/product/wigets/custom_dropdown_button.dart';
import 'package:interview_project/product/wigets/custom_text_field.dart';
import '../view_model/cubit/add_update_cubit.dart';

class AddView extends StatelessWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddAndUpdateCubit>(
      create: (context) => AddAndUpdateCubit(null),
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<AddAndUpdateCubit, AddAndUpdateState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                        hintString: 'Place',
                        context: context,
                        textController:
                            context.read<AddAndUpdateCubit>().placeController,
                        isObsecure: false,
                        node: context.read<AddAndUpdateCubit>().placeFocus),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomTextField(
                        hintString: 'Price',
                        context: context,
                        textInputType: TextInputType.number,
                        textController:
                            context.read<AddAndUpdateCubit>().priceController,
                        isObsecure: false,
                        node: context.read<AddAndUpdateCubit>().priceFocus),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomTextField(
                        hintString: 'Select Date',
                        context: context,
                        suffix: InkWell(
                            onTap: () => context
                                .read<AddAndUpdateCubit>()
                                .selectDate(context),
                            child: const Icon(Icons.calendar_today)),
                        textController:
                            context.read<AddAndUpdateCubit>().dateController,
                        isObsecure: false,
                        node: context.read<AddAndUpdateCubit>().dateFocus),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomDropDownButton(
                        items: context.read<AddAndUpdateCubit>().paymentTypes,
                        onChanged: (value) => context
                            .read<AddAndUpdateCubit>()
                            .changeSelectItems(value),
                        selectedValue:
                            context.read<AddAndUpdateCubit>().selectedValue,
                        tittleText:
                            context.read<AddAndUpdateCubit>().tittleText),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<AddAndUpdateCubit>().add(context);
                            },
                            child: Text("Add"),
                          ),
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
