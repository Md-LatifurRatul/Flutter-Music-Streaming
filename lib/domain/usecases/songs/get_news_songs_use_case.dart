import 'package:dartz/dartz.dart';
import 'package:flutter_spotify/core/usecase/use_case.dart';
import 'package:flutter_spotify/domain/repository/songs/songs_repository.dart';
import 'package:flutter_spotify/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getNewsSongs();
  }
}
