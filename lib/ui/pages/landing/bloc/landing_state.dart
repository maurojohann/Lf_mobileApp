part of 'landing_bloc.dart';

abstract class LandingState extends Equatable {
  const LandingState();

  @override
  List<Object> get props => [];
}

class LandingInitialState extends LandingState {}

class InitializingAppState extends LandingState {}

class InitializedAppState extends LandingState {}

class UserLoggedInState extends LandingState {}

class UserNotLoggedInState extends LandingState {}
