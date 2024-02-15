class MovieEntity {
  final int? id;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
 
  MovieEntity(this.id, this.originalTitle, this.overview, this.popularity,
      this.releaseDate, this.posterPath, this.voteAverage, this.voteCount);
}
