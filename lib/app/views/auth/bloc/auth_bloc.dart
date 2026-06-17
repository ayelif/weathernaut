import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      if (credential.user != null) {
        emit(AuthAuthenticated(credential.user!));
      } else {
        emit(const AuthError('Login failed: User object is null'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Authentication failed'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      if (credential.user != null) {
        await credential.user!.updateDisplayName(event.name);
        await credential.user!.reload();
        final updatedUser = FirebaseAuth.instance.currentUser;
        emit(AuthAuthenticated(updatedUser ?? credential.user!));
      } else {
        emit(const AuthError('Registration failed: User object is null'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Registration failed'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    await FirebaseAuth.instance.signOut();
    emit(AuthUnauthenticated());
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: event.email);
      emit(ForgotPasswordMailSent());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Password reset failed'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
