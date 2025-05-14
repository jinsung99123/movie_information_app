import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/UI/detail/detail_page.dart';
import 'package:movie_information_app/data/provider/home_provider.dart';

class HomeCategory extends ConsumerWidget {
  final String title;
  final String category;
  final String mapKey;

  const HomeCategory({
    Key? key,
    required this.title,
    required this.category,
    required this.mapKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieState = ref.watch(homeViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: movieState.when(
            data: (movieMap) {
              final movieList = movieMap[mapKey] ?? [];

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  final movie = movieList[index];
                  final posterPath = movie.posterPath;
                  final imageUrl = 'https://image.tmdb.org/t/p/w500$posterPath';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(movie: movie, category: category),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Hero(
                        tag: 'poster-image-${movie.id}-$category',
                        child: Image.network(
                          imageUrl,
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
