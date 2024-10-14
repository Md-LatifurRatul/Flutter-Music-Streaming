import 'package:dartz/dartz.dart';
import 'package:flutter_spotify/data/models/auth/create_user_request.dart';
import 'package:flutter_spotify/data/models/auth/sign_in_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<Either> signin(SignInUserReq signInUserRequest);
}
