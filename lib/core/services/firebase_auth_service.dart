import 'package:e_commerce/core/services/auth_service.dart';
import 'package:e_commerce/features/auth/data/models/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/data/models/register_model.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> login(LoginModel loginModel) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: loginModel.email!, password: loginModel.password!);
  }

  @override
  Future<void> register(UserInfoModel registerModel) async {
    final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerModel.email!,
        password: registerModel.password!,
      );
      credential.user!.sendEmailVerification();
  }
}
