import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/model/home.dart';
import 'package:movie_information_app/data/provider/detail_provider.dart';
import 'package:movie_information_app/data/model/detail.dart';

class DetailPage extends ConsumerWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailViewModelProvider(movie.id));

    return Scaffold(
      appBar: AppBar(title: Text('상세 페이지')),
      body: ListView(
        children: [
          // ✅ Hero는 항상 먼저 존재하도록!
          Container(
            height: 500,
            child: Hero(
              tag: 'poster-image-${movie.id}',
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ✅ 아래부터는 상태에 따라 달라짐
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
                      Text(movieDetail.genres.join(', ')),
                      Text(movieDetail.overview),
                      SizedBox(
                        height: 60,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Text('평점: ${movieDetail.voteAverage}'),
                            Text('평점 투표수: ${movieDetail.voteCount}'),
                            Text('인기 점수: ${movieDetail.popularity}'),
                            Text('예산: ${movieDetail.budget}'),
                            Text('수익: ${movieDetail.revenue}'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              movieDetail.productionCompanies
                                  .map((company) => Text(company))
                                  .toList(),
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
