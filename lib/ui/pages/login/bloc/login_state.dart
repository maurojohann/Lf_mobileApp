part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final bool isValidLogin;

  LoginLoadedState({this.isValidLogin = false});

  @override
  List<Object> get props => [isValidLogin];
}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({this.message});

  @override
  List<Object> get props => [message];
}
