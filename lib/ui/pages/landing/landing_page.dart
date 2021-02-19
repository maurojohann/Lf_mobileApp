import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app/routes/app_routes.dart';

import 'package:mobile_app/ui/pages/Vehicles/vehicles_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc/landing_bloc.dart';
import '../login/login_page.dart';

class LandingPage extends StatefulWidget {
  // Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();

  // Future<void> devUser() async {
  //    final SharedPreferences prefs = await _prefs;
  //    if(prefs.containsKey('token')){
  //    String user =  prefs.getString('token') ?? '';}

  // }

//  int counter = (prefs.getInt('counter') ?? 0) + 1;
//   print('Pressed $counter times.');
//   await prefs.setInt('counter', counter);

  final LandingBloc landingBloc = GetIt.I.get<LandingBloc>();

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void initState() {
    super.initState();
    widget.landingBloc.add(InitAppEvent());
  }

  // @override
  // void dispose() {
  //   widget.landingBloc.close();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => widget.landingBloc,
      child: BlocListener<LandingBloc, LandingState>(
        listener: (_conext, state) {
          if (state is UserLoggedInState) {
            Navigator.of(context)
                .pushReplacementNamed(AppRoutes.VEHICLE_DETAIL);
          } else if (state is UserNotLoggedInState) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN_HOME);
          }
        },
        child: _buildScreen(),
      ),
    );
  }

  Scaffold _buildScreen() {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CircularProgressIndicator(), Text('Aguarde')],
    )));
  }
}
