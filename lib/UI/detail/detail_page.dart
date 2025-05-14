import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/UI/detail/widgets/tag_container.dart';
import 'package:movie_information_app/data/model/home.dart';
import 'package:movie_information_app/data/provider/detail_provider.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;
  final String category;
  const DetailPage({super.key, required this.movie, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailViewModelProvider(movie.id));

    return Scaffold(
      appBar: AppBar(title: Text('상세 페이지')),
      body: ListView(
        children: [
          Container(
            height: 600,
            child: Hero(
              tag: 'poster-image-${movie.id}-$category',
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          detailState.when(
            loading:
                () => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                ),
            error:
                (error, stackTrace) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: Text('영화 정보 불러오기 실패.')),
                ),
            data:
                (movieDetail) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            movieDetail.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(movieDetail.releaseDate),
                        ],
                      ),
                      Text(movieDetail.tagline),
                      Text('${movieDetail.runtime}분'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children:
                                movieDetail.genres.map((genre) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      genre,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                          Divider(),
                        ],
                      ),
                      Text(movieDetail.overview),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          children: [
                            TagContainer('평점: ${movieDetail.voteAverage}'),
                            TagContainer('평점 투표수: ${movieDetail.voteCount}'),
                            TagContainer('인기 점수: ${movieDetail.popularity}'),
                            TagContainer('예산: ${movieDetail.budget}'),
                            TagContainer('수익: ${movieDetail.revenue}'),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieDetail.productionCompanies.length,
                          itemBuilder: (context, index) {
                            var company =
                                movieDetail.productionCompanies[index];
                            var logoPath = company['logo_path'];

                            if (logoPath != null) {
                              var imageUrl =
                                  'https://image.tmdb.org/t/p/w500$logoPath';

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(
                                      0.9,
                                    ), 
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(
                                    imageUrl,
                                    width: 100,
                                    height: 50,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
