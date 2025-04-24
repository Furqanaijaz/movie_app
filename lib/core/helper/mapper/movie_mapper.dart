import 'package:netfilx/data/movies/models/movie.dart';
import 'package:netfilx/domain/movies/entity/movie_enitity.dart';

class MovieMapper {
  static MovieEnitity toEntity(MovieModel movie) {
    return MovieEnitity(
        backdropPath: movie.backdropPath,
        id: movie.id,
        title: movie.title,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        posterPath: movie.posterPath,
        mediaType: movie.mediaType,
        adult: movie.adult,
        originalLanguage: movie.originalLanguage,
        genreIds: movie.genreIds,
        popularity: movie.popularity,
        releaseDate: movie.releaseDate,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount);
  }
}
