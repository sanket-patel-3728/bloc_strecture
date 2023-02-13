import 'dart:async';

import 'package:api_call/route/Routs.dart';
import 'package:api_call/services/local_db/database_services.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'bloc/language_bloc/language_bloc.dart';
import 'bloc/theme_bloc/theme_bloc.dart';
import 'services/app_localization_services/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.initiateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, theme) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (_, language) {
              return MaterialApp(
                locale: language.locale,
                supportedLocales: L10n.all,
                localizationsDelegates: const [
                  AppLocalizations.delegate, // Add this line
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: theme.themeData,
                onGenerateRoute: AppRouter.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
