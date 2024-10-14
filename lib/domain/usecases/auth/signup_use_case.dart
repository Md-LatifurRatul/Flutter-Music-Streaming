import 'package:dartz/dartz.dart';
import 'package:flutter_spotify/core/usecase/use_case.dart';
import 'package:flutter_spotify/data/models/auth/create_user_request.dart';
import 'package:flutter_spotify/domain/repository/auth/auth_repository.dart';
import 'package:flutter_spotify/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
