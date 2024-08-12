import 'package:dartz/dartz.dart';

import '../../../../utils/errors/failure.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';

abstract class AuthRepo {
  Future<Either<void, Failure>> login(LoginModel loginModel);
  Future<Either<void, Failure>> register(RegisterModel registerModel);
}
