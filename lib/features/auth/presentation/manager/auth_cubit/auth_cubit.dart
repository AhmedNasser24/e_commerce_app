import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/errors/failure.dart';
import '../../../data/models/login_model.dart';
import '../../../data/repos/auth_repo_iml.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthRepo _authRepoImpl = AuthRepoIml();
  Future<void> login(context, {required LoginModel loginMOdel}) async {
    emit(AuthLoading()) ;
    Either<void, Failure> response =
        await _authRepoImpl.login(loginModel: loginMOdel);
    response.fold(
      (ok) {
        if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
          emit(AuthFailure(
              S.of(context).please_check_your_email_for_verification));
        } else {
          emit(AuthSuccess());
        }
      },
      (failure) => emit(AuthFailure(failure.errMessage)),
    );
  }

  Future<void> register(context, {required RegisterModel registerModel}) async {
    emit(AuthLoading()) ;
    Either<void, Failure> response =
        await _authRepoImpl.register(registerModel: registerModel);
    response.fold(
      (ok) => emit(AuthSuccess()),
      (failure) => emit(AuthFailure(failure.errMessage)),
    );
  }
}
