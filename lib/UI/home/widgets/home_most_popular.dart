import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/provider/movie_provider.dart';

class HomeMostPopular extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieState = ref.watch(movieViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('가장 인기있는', style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: movieState.when(
            data: (movieMap) {
              final topRated = movieMap['topRated'] ?? [];

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  final movie = topRated[index];
                  final posterPath = movie.posterPath;
                  final imageUrl = 'https://image.tmdb.org/t/p/w500$posterPath';

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.network(imageUrl, width: 120, height: 180, fit: BoxFit.cover),
                  );
                },
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('에러 발생'),
          ),
        ),
      ],
    );
  }
}
