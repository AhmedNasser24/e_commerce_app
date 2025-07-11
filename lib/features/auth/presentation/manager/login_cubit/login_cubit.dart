import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/services/notification_service.dart';
import 'package:e_commerce/core/utils/shared_preference_singleton.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/login_model.dart';
import '../../../data/models/register_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepoImpl) : super(LoginInitial());
    final AuthRepo _authRepoImpl;
   UserInfoModel? userInfo;
  // late String notificationToken ;
  Future<void> login(context, {required LoginModel loginModel}) async {
    emit(LoginLoading());
    Either<void, Failure> loginResponse =
        await _authRepoImpl.login(loginModel: loginModel);

    // check if account kind is right for this email ?
    bool isValid = true;
    late String userKind1, userKind2;
    Either<UserInfoModel, Failure> userResponse =
        await _authRepoImpl.getUserInfoModel();
    if (loginModel.accountKind == kTraderAccountKindEnglish ||
        loginModel.accountKind == kTraderAccountKindArabic) {
      userKind1 = kTrader;
    } else {
      userKind1 = kCustomer;
    }
    log("userKind1 = $userKind1");
    userResponse.fold(
      (userInfoModel) async {
        if (userInfoModel.accountKind == kTraderAccountKindEnglish ||
            userInfoModel.accountKind == kTraderAccountKindArabic) {
          userKind2 = kTrader;
        } else {
          userKind2 = kCustomer;
        }
        log("userKind2 = $userKind2");
        if (userKind1 != userKind2) {
          isValid = false;
        } else {
          userInfo = userInfoModel;
          if (userInfo!.notificationToken == null && userKind1 == kCustomer) {
            userInfo!.notificationToken = await NotificationService().getToken();
            await _authRepoImpl.setCustomerInfoIntoFireStore(userInfo!);
            // notificationToken = userInfo.notificationToken!;
          }
        }
      },
      (fail) => isValid = false,
    );
    // --------------------------------------------------------------------

    loginResponse.fold(
      (ok) {
        // if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
        if (isValid) {
          NotificationService().subscribeToTopic();
          SharedPreferenceSingleton.setbool(kIsLogin, true) ;
          SharedPreferenceSingleton.setString(kAccountKind, userKind1);
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(AppLocalizations.of(context)!.invalid_email));
        }

        // } else {
        //   emit(LoginFailure(
        //       AppLocalizations.of(context)!.please_check_your_email_for_verification));
        // }
      },
      (failure) => emit(LoginFailure(failure.errMessage)),
    );
  }



  Future<void> getUserInfo()async{
    Either<UserInfoModel, Failure> response = await _authRepoImpl.getUserInfoModel();
    response.fold(
      (userInfoModel) => {
        userInfo = userInfoModel
      },
      (failure) => {},
    );
  }
}
