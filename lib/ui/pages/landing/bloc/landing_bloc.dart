import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobile_app/services/store.dart';
import 'package:mobile_app/ui/repository/vehicles_repository.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  VehiclesRepository allVehicles;
  LandingBloc(
    this.allVehicles,
  ) : super(LandingInitialState());

  // Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();

  // Future<void> devUser() async {
  //    final SharedPreferences prefs = await _prefs;
  //    if(prefs.containsKey('token')){
  //    String user =  prefs.getString('token') ?? '';}

  // }

//  int counter = (prefs.getInt('counter') ?? 0) + 1;
//   print('Pressed $counter times.');
//   await prefs.setInt('counter', counter);

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

        await allVehicles.saveAllVehicles(mapHeadresAutorization);
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
