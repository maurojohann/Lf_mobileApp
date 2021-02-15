import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/ui/models/auth_token.dart';
import 'dart:convert' as convert;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  AuthToken token;
  var url = 'https://rastrear.lftecnologia.com.br/api/auth/tokn/';

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is DoLogingEvent) {
      try {
        yield LoginLoadingState();
        var response = await http.post(url,
            body: {'username': event.username, 'password': event.password});
        print(convert.jsonDecode(response.body));
        if (response.statusCode == 200) {
          token = AuthToken.fromJson(convert.jsonDecode(response.body));
        } else {
          yield LoginErrorState(message: 'Erro no Login');
        }
        yield LoginLoadedState();
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
