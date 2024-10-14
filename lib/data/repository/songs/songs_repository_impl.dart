import 'package:dartz/dartz.dart';
import 'package:flutter_spotify/data/sources/songs/songs_firebase_service.dart';

import 'package:flutter_spotify/domain/repository/songs/songs_repository.dart';
import 'package:flutter_spotify/service_locator.dart';

class SongsRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongsFirebaseService>().getNewsSongs();
  }
}
