import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_consumer.dart';
import 'core/api/api_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'features/random_quote/data/datasources/local_data/random_quote_local.dart';
import 'features/random_quote/data/datasources/remote_data/random_remote_data.dart';
import 'features/random_quote/data/repositories/quote_repository_imp.dart';
import 'features/random_quote/domain/repositories/quote_repository.dart';
import 'features/random_quote/domain/usecases/get_random_quote.dart';
import 'features/random_quote/presentation/cubit/random_quote_cubit.dart';

final sl = GetIt.instance;

Future init() async {
  //! Features
  // Blocs

  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  //use cases
  sl.registerLazySingleton(() => GetRandomQuoteUseCase(quoteRepository: sl()));
  //Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
        localDataSource: sl(),
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));
  //Data Source

  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(
            apiConsumer: sl(),
          ));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(
  //   () => http.Client(),
  // );

  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
}
