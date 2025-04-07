part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginFailure extends AuthState {
  final String errMessage ;
  LoginFailure(this.errMessage);
}



