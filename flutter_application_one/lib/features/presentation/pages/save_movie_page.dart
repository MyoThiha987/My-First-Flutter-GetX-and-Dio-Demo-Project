import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

import '../../domain/entities/movie.dart';
import '../controllers/save_movie_controller.dart';

class SavedMoviePage extends GetView<SaveMovieController> {
  const SavedMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Movie'),
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.movies.length,
          itemBuilder: (context, index) {
            final movie = controller.movies[index];
            return movieCardView(movie);
          })),
    );
  }

  Widget movieCardView(MovieEntity data) {
    return ListTile(
      title: Text(data.originalTitle ?? ""),
      subtitle: Text("Vote Count ${data.voteAverage ?? 0}"),
      leading: CachedNetworkImage(
        cacheManager: CacheManager(
            Config('customKey', stalePeriod: const Duration(days: 7))),
        width: 100,
        height: 100,
        imageUrl: "https://image.tmdb.org/t/p/original/${data.posterPath}",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => const Center(
          widthFactor: 50.0,
          heightFactor: 50.0,
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      trailing: IconButton(
          onPressed: () {
            controller.deleteMovie(data);
          },
          icon: const Icon(Icons.delete)),
    );
  }
}
