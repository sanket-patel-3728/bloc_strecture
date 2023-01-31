import 'package:api_call/bloc/theme_bloc/theme_bloc.dart';
import 'package:api_call/bloc/user_bloc/user_bloc.dart';
import 'package:api_call/constants/enums.dart';
import 'package:api_call/repository/user_repository/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/language_bloc/language_bloc.dart';
import '../services/local_db/database_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.hello),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ThemeChangeEvent());
              },
              icon: const Icon(Icons.brightness_4),
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return ["en", "hi", "gu"].map((lan) {
                  return PopupMenuItem(
                    onTap: () {
                      context
                          .read<LanguageBloc>()
                          .add(ChangeLanguage(lan.stringToLanguage));
                    },
                    child: SizedBox(
                      width: 50,
                      height: 30,
                      child: Center(child: Text(lan)),
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UserErrorState) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(state.errorMessage),
              ));
            }

            if (state is NoInternetState) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(state.noInternetMessage),
              ));
            }
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserLoadedState) {
              return SmartRefresher(
                controller: RefreshController(),
                onRefresh: () {
                  BlocProvider.of<UserBloc>(context).add(LoadApiEvent());
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: ListTile(
                          title: Text(
                              "${state.users[index].firstName} ${state.users[index].lastName}"),
                          subtitle: Text(state.users[index].email ?? ""),
                          leading: CircleAvatar(
                            radius: 30,
                            foregroundImage: Image.network(state
                                        .users[index].avatar ??
                                    "https://www.seekpng.com/png/detail/115-1150622_avatar-demo2x-man-avatar-icon-png.png")
                                .image,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state.users.length,
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
