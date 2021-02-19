import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:mobile_app/routes/app_routes.dart';
import 'package:mobile_app/ui/models/auth_token.dart';
import 'package:mobile_app/ui/pages/Vehicles/vehicles_page.dart';

import 'ui/models/vehicles.dart';
import 'ui/pages/login/bloc/login_bloc.dart';
import 'ui/pages/landing/bloc/landing_bloc.dart';
import 'ui/pages/landing/landing_page.dart';
import 'ui/pages/login/login_page.dart';
import 'ui/pages/map/map_page.dart';
import 'ui/repository/vehicles_repository.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<VehiclesRepository>(VehiclesRepository());
  getIt.registerFactory<LoginBloc>(
      () => LoginBloc(getIt.get<VehiclesRepository>()));
  getIt.registerFactory<LandingBloc>(
      () => LandingBloc(getIt.get<VehiclesRepository>()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xff021B79);
    final primaryColorDark = Color(0xff13294B);
    final primaryColorLight = Color(0xff0575E6);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorLight: primaryColorLight,
        primaryColorDark: primaryColorDark,
        primaryColor: primaryColor,
        primarySwatch: Colors.blue,
        accentColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            alignLabelWithHint: true),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(primary: primaryColor),
            buttonColor: primaryColor,
            textTheme: ButtonTextTheme.primary,
            splashColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
      home: LandingPage(),
      routes: {
        AppRoutes.LOGIN_HOME: (ctx) => LoginPage(),
        AppRoutes.VEHICLE_DETAIL: (ctx) => VehiclesPage(),
      },
    );
  }
}
