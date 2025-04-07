import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/shared_preference_singleton.dart';
import '../../../data/repos/auth_repo.dart';
import '../../../data/repos/auth_repo_iml.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());
  final AuthRepo _authRepoImpl = AuthRepoIml();
  Future<void> signOut() async {
    emit(SignOutLoading());
    Either<void, Failure> response = await _authRepoImpl.signOut();
    response.fold(
      (ok) {
        SharedPreferenceSingleton.setbool(kIsLogin, false);
        SharedPreferenceSingleton.setString(kAccountKind, '');
        emit(SignOutSuccess());
      },
      (failure) => emit(SignOutFailure(failure.errMessage)),
    );
  }
}
