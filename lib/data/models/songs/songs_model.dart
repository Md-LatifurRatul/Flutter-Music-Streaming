import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spotify/domain/entities/songs/songs_entity.dart';

class SongsModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;

  SongsModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate});

  SongsModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongsModelX on SongsModel {
  SongsEntity toEntity() {
    return SongsEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!);
  }
}
