import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_project/feature/settingsPage/view_model/cubit/setting_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
          ),
          body: BlocConsumer<SettingCubit, SettingState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Go to Profile"),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text("Change Language"),
                      leading: Icon(Icons.language),
                    ),
                    ListTile(
                      title: Text("Night Mode"),
                      leading: Icon(Icons.nightlight),
                      trailing: Switch(
                        value: context.read<SettingCubit>().isSwitched,
                        onChanged: (value) {
                          context.read<SettingCubit>().changeSwitched(value);
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.info),
                    ),
                    ListTile(
                      title: Text("Log Out"),
                      leading: Icon(Icons.logout),
                    ),
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
