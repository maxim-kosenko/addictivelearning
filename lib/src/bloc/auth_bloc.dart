import 'dart:async' show Stream;

import 'package:addictivelearning/src/models/user.dart';
import 'package:addictivelearning/src/repository/auth_repository.dart';
import 'package:bloc/bloc.dart' show Bloc;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => LoadingAuthState();
  AuthRepository repository = AuthRepository();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is RegisterEvent) {
      yield* register(event);
    }
  }

  Stream<AuthState> register(RegisterEvent event) async* {
    yield LoadingAuthState();
    try {
      await repository.register(event.user);
      yield LoadedAuthState(event.user);
    } catch (error) {
      yield ErrorAuthState(error.toString());
    }
  }
}

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List<dynamic> props = const <dynamic>[]]) : super(props);
}

class RegisterEvent extends AuthEvent {
  final User user;

  RegisterEvent({this.user});

  @override
  String toString() => 'RegisterEvent';
}

@immutable
abstract class AuthState extends Equatable {
  AuthState([List<dynamic> props = const <dynamic>[]]) : super(props);

  @override
  String toString();
}

class LoadingAuthState extends AuthState {
  @override
  String toString() => 'LoadingAuth';
}

class LoadedAuthState extends AuthState {
  final User user;

  LoadedAuthState(this.user);

  @override
  String toString() => 'LoadedAuth';
}

class ErrorAuthState extends AuthState {
  ErrorAuthState(this.error);

  final String error;

  @override
  String toString() => error;
}
