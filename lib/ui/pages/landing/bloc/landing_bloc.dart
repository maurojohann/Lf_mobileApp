import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingInitialState());

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

    if (event is InitAppEvent) {
      yield InitializingAppState();
      await Future.delayed(Duration(seconds: 5));
      bool isLogged = _prefs.containsKey('Token');
      if (!isLogged) {
        yield UserNotLoggedInState();
      } else {
        yield UserLoggedInState();
      }
    }
  }
}
