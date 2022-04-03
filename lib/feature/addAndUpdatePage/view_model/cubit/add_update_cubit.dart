import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interview_project/core/locale/locale_manager.dart';
import 'package:interview_project/feature/home/view/home_view.dart';
import 'package:interview_project/product/utils/cache/cache_manager.dart';
import 'package:intl/intl.dart';
import '../../model/model.dart';
part 'add_update_state.dart';

class AddAndUpdateCubit extends Cubit<AddAndUpdateState> {
  AddAndUpdateCubit(this.currentModel) : super(AddInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Model? model;
  Model? currentModel;
  TextEditingController placeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController updatePlaceController = TextEditingController();
  TextEditingController updatePriceController = TextEditingController();
  TextEditingController updateDateController = TextEditingController();
  FocusNode placeFocus = FocusNode();
  FocusNode priceFocus = FocusNode();
  FocusNode dateFocus = FocusNode();
  String? selectedValue;
  String? updateSelectedValue;
  String tittleText = "Select Payment Type";
  List<String> paymentTypes = ["Credit Card", "Bank Card", "Cash", "Others"];

  void changeSelectItems(String? value) {
    selectedValue = value;
    emit(AddonChange());
  }

  void changeUpdateSelectItems(String? value) {
    updateSelectedValue = value;
    emit(AddonChange());
  }

  DateTime dateTime = DateTime.now();
  selectDate(BuildContext context) async {
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      dateTime = pickedDate;
      dateController.text = DateFormat("dd-MM-yyyy").format(pickedDate);
    }
  }

  Future add(BuildContext context) async {
    String docId = firestore.collection("usersData").doc().id;
    model = Model(
        userId: CacheManager.getStringData(PreferencesKey.userUID),
        date: dateController.text,
        place: placeController.text,
        price: double.parse(priceController.text),
        paymentType: selectedValue ?? "",
        id: docId);

    await firestore
        .collection("usersData")
        .doc(docId)
        .set(model!.toJson())
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView())));
    emit(AddDataCompleted());
  }

  Future update(BuildContext context) async {
    String docId = firestore.collection("usersData").doc().id;
    model = Model(
        userId: CacheManager.getStringData(PreferencesKey.userUID),
        date: updateDateController.text,
        place: updatePlaceController.text,
        price: double.parse(updatePriceController.text),
        paymentType: updateSelectedValue ?? "",
        id: docId);
    await firestore
        .collection("usersData")
        .doc(currentModel?.id)
        .update(model!.toJson())
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView())));
    emit(AddDataCompleted());
  }

  Future delete(BuildContext context, String id) async {
    String docId = firestore.collection("usersData").doc().id;
    model = Model(
        userId: CacheManager.getStringData(PreferencesKey.userUID),
        date: dateController.text,
        place: placeController.text,
        price: double.parse(priceController.text),
        paymentType: selectedValue,
        id: docId);
    await firestore.collection("usersData").doc(id).delete().then((value) =>
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView())));
    emit(AddDataCompleted());
  }
}
