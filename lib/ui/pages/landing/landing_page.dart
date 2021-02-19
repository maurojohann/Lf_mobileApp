import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app/routes/app_routes.dart';
import './bloc/landing_bloc.dart';

class LandingPage extends StatefulWidget {
  final LandingBloc landingBloc = GetIt.I.get<LandingBloc>();

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void initState() {
    super.initState();
    widget.landingBloc.add(InitAppEvent());
  }

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
