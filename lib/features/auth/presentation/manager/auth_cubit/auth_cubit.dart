import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/shared_preference_singleton.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
// import '../../../../../generated/l10n.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/notification_service.dart';
import '../../../data/models/login_model.dart';
import '../../../data/repos/auth_repo_iml.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthRepo _authRepoImpl = AuthRepoIml();
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
    userResponse.fold(
      (userInfoModel) async {
        if (userInfoModel.accountKind == kTraderAccountKindEnglish ||
            userInfoModel.accountKind == kTraderAccountKindArabic) {
          userKind2 = kTrader;
        } else {
          userKind2 = kCustomer;
        }
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
          emit(LoginFailure(LocaleKeys.invalid_email.tr()));
        }

        // } else {
        //   emit(LoginFailure(
        //       LocaleKeys.please_check_your_email_for_verification.tr()));
        // }
      },
      (failure) => emit(LoginFailure(failure.errMessage)),
    );
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    Either<void, Failure> response = await _authRepoImpl.signOut();
    response.fold((ok)  {
      SharedPreferenceSingleton.setbool(kIsLogin, false);
      SharedPreferenceSingleton.setString(kAccountKind, '');
      emit(SignOutSuccess());
    },
        (failure) => emit(SignOutFailure(failure.errMessage)));
  }

  Future<void> register(context, {required UserInfoModel userInfo}) async {
    String userKind = '';
    emit(RegisterLoading());
    Either<void, Failure> response =
        await _authRepoImpl.register(registerModel: userInfo);
    response.fold(
      (ok) async {
        late Either<void, Failure> response1;
        if (userInfo.accountKind == kTraderAccountKindEnglish ||
            userInfo.accountKind == kTraderAccountKindArabic) {
          userKind = kTrader;
          response1 = await _authRepoImpl.setTraderInfoIntoFireStore(userInfo);
        } else {
          userInfo.notificationToken = await NotificationService().getToken();
          userKind = kCustomer;
          response1 =
              await _authRepoImpl.setCustomerInfoIntoFireStore(userInfo);
        }
        response1.fold(
          (ok) {
            SharedPreferenceSingleton.setbool(kIsLogin, true);
            SharedPreferenceSingleton.setString(kAccountKind, userKind);
            emit(RegisterSuccess());
          },
          (failure) => emit(RegisterFailure(failure.errMessage)),
        );
      },
      (failure) => emit(RegisterFailure(failure.errMessage)),
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
