part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const SignUpRequested(this.email, this.password, this.name);

  @override
  List<Object?> get props => [email, password, name];
}

class SignOutRequested extends AuthEvent {}

class ForgotPasswordRequested extends AuthEvent {
  final String email;

  const ForgotPasswordRequested(this.email);

  @override
  List<Object?> get props => [email];
}
