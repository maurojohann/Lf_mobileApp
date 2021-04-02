import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobile_app/services/store.dart';
import 'package:mobile_app/ui/repository/vehicles_repository.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LFVehiclesRepository allVehicles;
  LandingBloc(
    this.allVehicles,
  ) : super(LandingInitialState());

  @override
  Stream<LandingState> mapEventToState(
    LandingEvent event,
  ) async* {
    final _prefs = await SharedPreferences.getInstance();
    yield LandingInitialState();
    bool isLogged;

    if (event is InitAppEvent) {
      yield InitializingAppState();

      await Future.delayed(Duration(seconds: 2));

      if (_prefs.containsKey('Token')) {
        Map<String, String> mapHeadresAutorization = {
          'Authorization': 'Token ' + await Store.getString('Token')
        };

        await allVehicles.getAllVehicles(mapHeadresAutorization);
        isLogged = allVehicles.getVehiclesIsValid;
      } else {
        isLogged = false;
      }

      if (!isLogged) {
        yield UserNotLoggedInState();
      } else {
        yield UserLoggedInState();
      }
    }
  }
}
