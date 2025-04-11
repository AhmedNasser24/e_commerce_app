import 'package:e_commerce/core/services/auth_service.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_iml.dart';
import '../../features/customer/data/repo/customer_repo_impl.dart';
import '../../features/trader/data/repo/trader_repo.dart';
import '../../features/trader/data/repo/trader_repo_impl.dart';
import '../services/database_services.dart';
import '../services/firestore_services.dart';
import '../services/notification_service.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<AuthService>(FirebaseAuthService());

  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<NotificationService>(NotificationService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoIml(
      authService: getIt<AuthService>(),
      dataBaseServices: getIt<DatabaseServices>(),
    ),
  );
  getIt.registerSingleton<CustomerRepo>(
    CustomerRepoImpl(
      dataBaseServices: getIt<DatabaseServices>(),
    ),
  );
  getIt.registerSingleton<TraderRepo>(
    TraderRepoImpl(
      dataBaseServices: getIt<DatabaseServices>(),
    ),
  );
}
