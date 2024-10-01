import 'package:flutter_spotify/data/repository/auth/auth_repository_imp.dart';
import 'package:flutter_spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:flutter_spotify/domain/repository/auth_repository.dart';
import 'package:flutter_spotify/domain/usecases/auth/signin.dart';
import 'package:flutter_spotify/domain/usecases/auth/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseServices>(
    AuthFirebaseServicesImpl(),
  );
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImp(),
  );
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );
}
