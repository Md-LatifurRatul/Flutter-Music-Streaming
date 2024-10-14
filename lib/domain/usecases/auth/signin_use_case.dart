import 'package:dartz/dartz.dart';
import 'package:flutter_spotify/core/usecase/use_case.dart';
import 'package:flutter_spotify/data/models/auth/sign_in_user_req.dart';
import 'package:flutter_spotify/domain/repository/auth/auth_repository.dart';
import 'package:flutter_spotify/service_locator.dart';

class SigninUseCase implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
