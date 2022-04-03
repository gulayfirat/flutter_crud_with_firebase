import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interview_project/core/locale/locale_manager.dart';
import 'package:interview_project/feature/addAndUpdatePage/view_model/cubit/add_update_cubit.dart';
import 'package:interview_project/product/utils/cache/cache_manager.dart';
import 'package:interview_project/product/utils/firebase/storage_functions.dart';
import 'package:meta/meta.dart';
import '../../../addAndUpdatePage/model/model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    init();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Model>? model;
  bool isLoading = false;
  String? userId;
  AddAndUpdateCubit? addAndUpdateCubit;

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> getData() async {
    changeLoading();
    model = await FirebaseStorageFunction().getModels(
        ownedUID: CacheManager.getStringData(PreferencesKey.userUID) ?? '');
    changeLoading();
  }

  Future delete(String id, index) async {
    await firestore
        .collection("usersData")
        .doc(id)
        .delete()
        .then((value) => print("okey"));
    model?.removeAt(index);
    emit(DeleteData());
  }

  Future init() async {
    await getData();
    emit(Completed());
  }
}
