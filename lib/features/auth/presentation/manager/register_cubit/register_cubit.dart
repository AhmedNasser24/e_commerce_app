
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/notification_service.dart';
import 'package:e_commerce/core/utils/shared_preference_singleton.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_iml.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/register_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final AuthRepo _authRepoImpl = AuthRepoIml();
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


}
