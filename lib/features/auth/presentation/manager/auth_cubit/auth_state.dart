part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginFailure extends AuthState {
  final String errMessage ;
  LoginFailure(this.errMessage);
}
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}
class RegisterFailure extends AuthState {
  final String errMessage ;
  RegisterFailure(this.errMessage);
}

class SignOutLoading extends AuthState {}

class SignOutSuccess extends AuthState {}
class SignOutFailure extends AuthState {
  final String errMessage ;
  SignOutFailure(this.errMessage);
}
