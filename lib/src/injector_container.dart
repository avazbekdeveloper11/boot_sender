import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'config/router/app_routes.dart';
// import 'core/connectivity/internet_connection_checker.dart';
// import 'core/constants/constants.dart';
// import 'core/platform/network_info.dart';
// import 'data/source/local_source.dart';

final sl = GetIt.instance;
// late Box<dynamic> _box;

Future<void> init() async {
  /// External
  // await initHive();

  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        headers: {
          'Authorization': 'API-KEY',
          // 'X-API-KEY': Constants.apiKey,
          // 'Resource-Id': Constants.resourceId,
          // 'Environment-Id': Constants.environmentId,
        },
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            requestBody: kDebugMode,
            responseBody: kDebugMode,
            logPrint: (object) => kDebugMode ? log('dio: $object') : null,
          ),
          if (kDebugMode) chuck.getDioInterceptor(),
        ],
      ),
  );
  sl<Dio>().interceptors.add(
        RetryInterceptor(
          dio: sl<Dio>(),
          toNoInternetPageNavigator: () async {
            final lastMatch = router.routerDelegate.currentConfiguration.last;
            final matchList =
                lastMatch is ImperativeRouteMatch ? lastMatch.matches : router.routerDelegate.currentConfiguration;
            final String location = matchList.uri.toString();
            if (location.contains(Routes.internetConnection)) {
              return;
            }
            await router.pushNamed(Routes.internetConnection);
          },
          // accessTokenGetter: () => localSource.accessToken,
          refreshTokenFunction: () async {
            // await localSource.userClear().then(
            //   (value) {
            //     rootNavigatorKey.currentContext!.goNamed(Routes.initial);
            //   },
            // );
          },
          logPrint: (object) {
            if (kDebugMode) log('dio: $object');
          },
        ),
      );

  // sl
  // ..registerSingleton<LocalSource>(LocalSource(_box))
  // ..registerLazySingleton(
  //   () => InternetConnectionChecker.createInstance(
  //     checkInterval: const Duration(seconds: 3),
  //   ),
  // )
  // ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// main
  // mainFeature();
  // homeFeature();

  /// auth
  // authFeature();
}

// void mainFeature() {
//   /// splash
//   sl.registerLazySingleton(MainBloc.new);
// }
//
// void homeFeature() {
//   sl.registerFactory<HomeBloc>(HomeBloc.new);
// }
//
// void authFeature() {
//   sl
//     ..registerFactory<AuthBloc>(() => AuthBloc(sl()))
//     ..registerFactory<ConfirmCodeBloc>(() => ConfirmCodeBloc(sl()))
//     ..registerFactory<RegisterBloc>(() => RegisterBloc(sl()))
//     ..registerLazySingleton<AuthRepository>(
//       () => AuthRepositoryImpl(dio: sl()),
//     );
// }

// Future<void> initHive() async {
//   const boxName = 'bloc_mobile_box';
//   final Directory directory = await getApplicationDocumentsDirectory();
//   Hive.init(directory.path);
//   _box = await Hive.openBox<dynamic>(boxName);
// }
