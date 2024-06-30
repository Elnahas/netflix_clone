import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix_clone/core/networking/dio_factory.dart';
import 'package:netflix_clone/features/home/data/repos/home_repo.dart';

import '../networking/api_service.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton(() => DioFactory(dio: Dio()));
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<DioFactory>().dio));

  //home
  getIt.registerLazySingleton<HomeRepo>(()=> HomeRepo(getIt()));
}