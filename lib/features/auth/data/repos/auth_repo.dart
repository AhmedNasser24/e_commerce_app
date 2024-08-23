import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';

abstract class AuthRepo {
  Future<Either<void, Failure>> login({required LoginModel loginModel});
  Future<Either<void, Failure>> register( {required UserInfoModel registerModel});
  Future<Either<void, Failure>> signOut();
  Future < Either < UserInfoModel? , Failure > > getCustomerInfoModel();
  Future < Either < UserInfoModel? , Failure > > gettraderInfoModel();
}
