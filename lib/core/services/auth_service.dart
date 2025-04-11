import 'package:e_commerce/features/auth/data/models/login_model.dart';

import '../../features/auth/data/models/register_model.dart';

abstract class AuthService {
  Future<void> signOut();
  Future<void> login(LoginModel loginModel);
  Future<void> register(UserInfoModel registerModel);
}