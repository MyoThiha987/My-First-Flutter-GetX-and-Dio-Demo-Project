import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_one/features/domain/entities/movie.dart';
import 'package:flutter_application_one/features/presentation/controllers/movie_controller.dart';
import 'package:flutter_application_one/features/presentation/controllers/save_movie_controller.dart';
import 'package:flutter_application_one/features/presentation/home_binding.dart';
import 'package:flutter_application_one/features/presentation/pages/save_movie_page.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  registerAdapter();
  await openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      initialBinding: HomeBinding(),
    );
  }
}

class MyHomePage extends GetView<MovieController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrofit with Dio and GetX'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const SavedMoviePage(), transition: Transition.leftToRight);
              },
              icon: const Icon(Icons.favorite))
        ],
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
    final SaveMovieController saveMovieController = Get.find();
    return ListTile(
      title: Text(data.originalTitle ?? ""),
      subtitle: Text("Vote Count ${data.voteAverage}"),
      leading: AspectRatio(
        aspectRatio: 1 / 1,
        child: CachedNetworkImage(
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
      ),
      trailing: IconButton(onPressed: () {
        // controller.movies

        if (saveMovieController.movies
            .map((element) => element.id)
            .contains(data.id)) {
          saveMovieController.movies
              .removeWhere((element) => element.id == data.id);
        } else {
          saveMovieController.saveMovie(data);
        }
      }, icon: Obx(() {
        if (saveMovieController.movies
            .map((element) => element.id)
            .contains(data.id)) {
          return const Icon(Icons.favorite);
        } else {
          return const Icon(Icons.favorite_border);
        }
      })),
      onTap: () {},
    );
  }
}
