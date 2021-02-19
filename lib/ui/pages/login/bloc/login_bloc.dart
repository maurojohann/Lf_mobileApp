import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:mobile_app/services/store.dart';
import 'dart:convert' as convert;

import '../../../repository/vehicles_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  VehiclesRepository allVehicles;
  LoginBloc(this.allVehicles) : super(LoginInitial());

  var urlToken = 'https://rastrear.lftecnologia.com.br/api/auth/token/';

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield LoginInitial();

    if (event is DoLogingEvent) {
      try {
        yield LoginLoadingState();

        dynamic response =
            await allVehicles.getUserAuthToken(event.username, event.password);

        if (response.statusCode == 200) {
          var jsonDecodes = convert.jsonDecode(response.body);
          await Store.saveString('Token', jsonDecodes['token']);

          Map<String, String> mapHeadresAutorization = {
            'Authorization': 'Token ' + jsonDecodes['token']
          };

          await allVehicles.getAllVehicles(mapHeadresAutorization);

          yield LoginLoadedState(isValidLogin: true);
        } else {
          yield LoginErrorState();
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
