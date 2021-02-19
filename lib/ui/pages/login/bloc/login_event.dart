part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DoLogingEvent extends LoginEvent {
  final String username;
  final String password;

  DoLogingEvent({
    this.username,
    this.password,
  });

  @override
  List<Object> get props => [username, password];
}
