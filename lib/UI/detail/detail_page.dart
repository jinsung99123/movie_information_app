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
    final detailState = ref.watch(detailViewModelProvider(movie.id)); // movie.id를 전달

    return Scaffold(
      appBar: AppBar(title: Text('상세 페이지')),
      body: detailState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        data: (movieDetail) => ListView(
          children: [
            Container(
              height: 500,
              child: Image.network('http://tmdb.org/t/p/w500${movie.posterPath}'),
            ),
            Padding(
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
                  Text(movieDetail.genres),
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
                      children: movieDetail.productionCompanies
                          .map((company) => Text(company))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        error: (error, stackTrace) => Center(
          child: Text('영화 정보를 가져오는 데 실패했습니다.'),
        ),
      ),
    );
  }
}
