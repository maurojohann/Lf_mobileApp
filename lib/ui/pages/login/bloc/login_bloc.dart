import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app/services/store.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:mobile_app/ui/models/auth_token.dart';
import 'package:mobile_app/ui/models/vehicles.dart';
import 'package:mobile_app/ui/repository/vehicles_repository.dart';

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

        var response = await http.post(urlToken,
            body: {'username': event.username, 'password': event.password});
        if (response.statusCode == 200) {
          var jsonDecodes = convert.jsonDecode(response.body);
          await Store.saveString('Token', jsonDecodes['token']);

          print(jsonDecodes['token']);

          Map<String, String> mapHeadresAutorization = {
            'Authorization': 'Token ' + jsonDecodes['token']
          };

          await allVehicles.saveAllVehicles(mapHeadresAutorization);
          print(allVehicles.getStringAllVehicles);
          yield LoginLoadedState(isValidLogin: true);
        } else {
          print('errorLoin');
          yield LoginErrorState();
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}

//   if (await Store.getMap('Token') == null) {}
//   if (event.username == 'teste' && event.password == 'asdfg1234') {
//     print('2b479dfe7c3364a8cd17af00565ae0aad808e607');

//     await Store.saveString('Token', '2b479dfe7c3364a8cd17af00565ae0aad808e607');

//     yield LoginLoadedState(isValidLogin: true);
//   } else {
//     print('errorLoin');
//     yield LoginErrorState();
//   }
// } catch (e) {
//   print(e.toString());
// }

// var response = await http.post(urlToken,
//     body: {'username': event.username, 'password': event.password});
// var jsonDecodes = convert.jsonDecode(response.body);
// if (response.statusCode == 200) {
//   // _authToken = AuthToken.fromJson(convert.jsonDecode(response.body));
//   print(jsonDecodes['token']);
//   Map<String, String> mapHeadresAutorization = {
//     'Authorization': 'Token ' + jsonDecodes['token']
//   };

//     yield LoginLoadedState();
//   } else {
//     print(jsonDecodes);
//     yield LoginErrorState(message: 'Erro no Login');
//   }
// } catch (e) {
//   print(e.toString());
