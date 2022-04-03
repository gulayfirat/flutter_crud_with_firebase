import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/core/locale/locale_manager.dart';
import 'package:interview_project/feature/home/view_model/cubit/home_cubit.dart';
import 'package:interview_project/feature/settingsPage/view/settings_view.dart';
import 'package:interview_project/product/utils/cache/cache_manager.dart';
import '../../addAndUpdatePage/views/add_view.dart';
import '../../addAndUpdatePage/views/update_view.dart';
part './subview/subtitle.dart';
part './subview/title.dart';
part './subview/delete_and_edit_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home Page'),
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    },
                    child: Icon(Icons.settings)),
              ),
            ],
          ),
          body: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return context.read<HomeCubit>().isLoading
                  ? Center(child: CircularProgressIndicator())
                  : StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('usersData')
                          .where("userId",
                              isEqualTo: CacheManager.getStringData(
                                  PreferencesKey.userUID))
                          .snapshots(),
                      builder: (
                        context,
                        snapshot,
                      ) {
                        if (snapshot.data == null) {
                          return const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.amber,
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount:
                              context.read<HomeCubit>().model?.length ?? 0,
                          itemBuilder: (context, int index) {
                            return ListTile(
                                title: title(
                                    context, index, context.read<HomeCubit>()),
                                subtitle: subtitle(context, index),
                                trailing: deleteUpdateButton(
                                    context, index, context.read<HomeCubit>()));
                          },
                        );
                      },
                    );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddView()));
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
