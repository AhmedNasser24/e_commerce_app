part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}
class RegisterFailure extends RegisterState {
  final String errMessage ;
  RegisterFailure(this.errMessage);
}