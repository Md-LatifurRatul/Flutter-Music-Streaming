import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify/domain/entities/songs/songs_entity.dart';
import 'package:flutter_spotify/presentation/pages/home/bloc/news_songs_cubit.dart';
import 'package:flutter_spotify/presentation/pages/home/bloc/news_songs_state.dart';

class NewsSongsWidget extends StatelessWidget {
  const NewsSongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
              builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            }

            if (state is NewsSongsLoaded) {
              return _songsListView(state.songs);
            }
            return Container();
          })),
    );
  }

  Widget _songsListView(List<SongsEntity> songsList) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const Column(
          children: [],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 14,
        );
      },
      itemCount: songsList.length,
    );
  }
}
