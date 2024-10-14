import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify/domain/usecases/songs/get_news_songs_use_case.dart';
import 'package:flutter_spotify/presentation/pages/home/bloc/news_songs_state.dart';
import 'package:flutter_spotify/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (data) {
        emit(NewsSongsLoaded(songs: data));
      },
    );
  }
}
