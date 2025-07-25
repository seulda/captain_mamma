import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/network_info.dart';
import '../../features/map/data/datasources/location_datasource.dart';
import '../../features/map/data/datasources/map_local_datasource.dart';
import '../../features/map/data/datasources/map_remote_datasource.dart';
import '../../features/map/data/repositories/map_repository_impl.dart';
import '../../features/map/domain/repositories/map_repository.dart';
import '../../features/map/domain/usecases/get_current_location.dart';
import '../../features/map/domain/usecases/search_restaurants.dart';
import '../../features/map/presentation/bloc/map_bloc.dart';

/// GetIt 서비스 로케이터 인스턴스
final sl = GetIt.instance;

/// 의존성 주입 초기화
Future<void> init() async {
  //! Features - Map
  await _initMapFeature();

  //! Core
  await _initCore();

  //! External
  await _initExternal();
}

/// Map Feature 의존성 등록
Future<void> _initMapFeature() async {
  // Bloc
  sl.registerFactory(() => MapBloc(
        getCurrentLocationUseCase: sl(),
        searchRestaurantsUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetCurrentLocation(sl()));
  sl.registerLazySingleton(() => SearchRestaurants(sl()));

  // Repository
  sl.registerLazySingleton<MapRepository>(
    () => MapRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      locationDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MapRemoteDataSource>(
    () => MapRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<MapLocalDataSource>(
    () => MapLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<LocationDataSource>(
    () => LocationDataSourceImpl(),
  );
}

/// Core 의존성 등록
Future<void> _initCore() async {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}

/// External 의존성 등록
Future<void> _initExternal() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
