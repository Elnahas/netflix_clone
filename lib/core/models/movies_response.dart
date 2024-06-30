import 'package:json_annotation/json_annotation.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<MoviesModel> moviesList;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  MoviesResponse({
    required this.page,
    required this.moviesList,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable()
class Dates {
  final DateTime maximum;
  final DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
  Map<String, dynamic> toJson() => _$DatesToJson(this);
}

@JsonSerializable()
class MoviesModel {
    bool adult;
    @JsonKey(name: 'backdrop_path')
    String backdropPath;
    @JsonKey(name: 'genre_ids')
    List<int> genreIds;
    int id;
    @JsonKey(name: 'original_language')
    String originalLanguage;
    @JsonKey(name: 'original_title')
    String originalTitle;
    String overview;
    double popularity;
    @JsonKey(name: 'poster_path')
    String posterPath;
    @JsonKey(name: 'release_date')
    DateTime releaseDate;
    String title;
    bool video;
    @JsonKey(name: 'vote_average')
    double voteAverage;
    @JsonKey(name: 'vote_count')
    int voteCount;

  MoviesModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => _$MoviesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}