part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class DoLogingEvent extends LoginEvent {
  final String username;
  final String password;

  DoLogingEvent({
    this.username,
    this.password,
  });
}
