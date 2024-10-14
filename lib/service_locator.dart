import 'package:flutter_spotify/data/repository/auth/auth_repository_imp.dart';
import 'package:flutter_spotify/data/repository/songs/songs_repository_impl.dart';
import 'package:flutter_spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:flutter_spotify/data/sources/songs/songs_firebase_service.dart';
import 'package:flutter_spotify/domain/repository/auth/auth_repository.dart';
import 'package:flutter_spotify/domain/repository/songs/songs_repository.dart';
import 'package:flutter_spotify/domain/usecases/auth/signin_use_case.dart';
import 'package:flutter_spotify/domain/usecases/auth/signup_use_case.dart';
import 'package:flutter_spotify/domain/usecases/songs/get_news_songs_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseServices>(
    AuthFirebaseServicesImpl(),
  );

  sl.registerSingleton<SongsFirebaseService>(
    SongsFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImp(),
  );

  sl.registerSingleton<SongsRepository>(
    SongsRepositoryImpl(),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );
}
