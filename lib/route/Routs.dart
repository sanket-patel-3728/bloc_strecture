import 'package:api_call/bloc/user_bloc/user_bloc.dart';
import 'package:api_call/repository/user_repository/UserRepository.dart';
import 'package:api_call/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => UserRepository(),
            child: BlocProvider(
              create: (BuildContext context) => UserBloc(
                RepositoryProvider.of<UserRepository>(context),
              ),
              child: const HomeScreen(),
            ),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => UserBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
            child: const HomeScreen(),
          ),
        );
    }
  }
}
