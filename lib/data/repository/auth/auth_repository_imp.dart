import 'package:dartz/dartz.dart';
import 'package:flutter_spotify/data/models/auth/create_user_request.dart';
import 'package:flutter_spotify/data/models/auth/sign_in_user_req.dart';
import 'package:flutter_spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:flutter_spotify/domain/repository/auth/auth_repository.dart';
import 'package:flutter_spotify/service_locator.dart';

class AuthRepositoryImp extends AuthRepository {
  @override
  Future<Either> signin(SignInUserReq signInUserRequest) async {
    return await sl<AuthFirebaseServices>().signin(signInUserRequest);
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    return await sl<AuthFirebaseServices>().signup(createUserRequest);
  }
}
