import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify/data/models/songs/songs_model.dart';
import 'package:flutter_spotify/domain/entities/songs/songs_entity.dart';

abstract class SongsFirebaseService {
  Future<Either> getNewsSongs();
}

class SongsFirebaseServiceImpl extends SongsFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongsEntity> songs = [];

      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy(
            'releaseDate',
            descending: true,
          )
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songModel = SongsModel.fromJson(element.data());
        print(element.data());
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return left('An error occurred, Please try again.');
    }
  }
}
