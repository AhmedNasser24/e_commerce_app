import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/errors/failure.dart';
import '../../../data/models/login_model.dart';
import '../../../data/repos/auth_repo_iml.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthRepo _authRepoImpl = AuthRepoIml();
  Future<void> login(context, {required LoginModel loginModel}) async {
    emit(AuthLoading());
    Either<void, Failure> response =
        await _authRepoImpl.login(loginModel: loginModel);
    response.fold(
      (ok) {
        // if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
        emit(AuthSuccess());
        // } else {
        //   emit(AuthFailure(
        //       S.of(context).please_check_your_email_for_verification));
        // }
      },
      (failure) => emit(AuthFailure(failure.errMessage)),
    );
  }

  Future<void> register(context, {required RegisterModel registerModel}) async {
    emit(AuthLoading());
    Either<void, Failure> response =
        await _authRepoImpl.register(registerModel: registerModel);
    response.fold(
      (ok) async {
        if (registerModel.accountKind == kTraderAccountKindEnglish ||
            registerModel.accountKind == kTraderAccountKindArabic) {
          await _setTraderInfoIntoFireStore(registerModel);
        } else {
          await _setCustomerInfoIntoFireStore(registerModel);
        }
        emit(AuthSuccess());
      },
      (failure) => emit(AuthFailure(failure.errMessage)),
    );
  }

  Future<void> _setTraderInfoIntoFireStore(RegisterModel registerModel) async {
    String traderUidDoc = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(traderUidDoc)
        .collection(kTraderCollection)
        .doc(kTraderInfoDoc)
        .set(registerModel.toJson());
  }

  Future<void> _setCustomerInfoIntoFireStore(
      RegisterModel registerModel) async {
    String customerUidDoc = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(customerUidDoc)
        .collection(kCustomerCollection)
        .doc(kCustomerInfoDoc)
        .set(registerModel.toJson());
  }
}
