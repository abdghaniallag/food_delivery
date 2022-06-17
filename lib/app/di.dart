   
// final instance = GetIt.instance;
// Future<void> initAppModule() async {
//   // Shared Preferences
//   final sharedPrefs = await SharedPreferences.getInstance();
//   instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
//   // App Preferences
//   instance
//       .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
//   // Network Info
//   instance.registerLazySingleton<NetworkInfo>(
//       () => NetworkInfoImpl(DataConnectionChecker()));
//   // Dio
//   instance.registerLazySingleton<DioFactoy>(() => DioFactoy(instance()));
//   // App Service Client
//   final dio = await instance<DioFactoy>().getDio();
//   instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
//   // Remot Data Source
//   instance.registerLazySingleton<RemotDataSource>(
//       () => RemotDataSourceImpilenter(instance()));
//   // local Data Source
//   instance.registerLazySingleton<LocalDataSource>(
//       () => LocalDataSourceImplimenter(instance()));
//   // RepositoryImpl
//   instance.registerLazySingleton<Repository>(
//       () => RepositoryImpl(instance(), instance(), instance()));
// }

// initLoginModule() {
//   if (!GetIt.I.isRegistered<LoginUseCase>()) {
//     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
//   }
// }

// initRegisterModule() {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//     instance.registerFactory<RegisterViewModel>(
//         () => RegisterViewModel(instance()));
//     instance.registerFactory<ImagePicker>(() => ImagePicker());
//   }
// }

// initForgotPasswordModule() {
//   if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
//     instance.registerFactory<ForgotPasswordUseCase>(
//         () => ForgotPasswordUseCase(instance()));
//     instance.registerFactory<ForgotPasswordViewModel>(
//         () => ForgotPasswordViewModel(instance()));
//   }
// }

// initHomeModule() {
//   if (!GetIt.I.isRegistered<HomeUseCase>()) {
//     instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
//     instance.registerFactory<HomePageViewModel>(
//         () => HomePageViewModel(instance()));
//   }
// }

// initStoresModule() {
//   if (!GetIt.I.isRegistered<StoreDetailUseCase>()) {
//     instance.registerFactory<StoreDetailUseCase>(
//         () => StoreDetailUseCase(instance()));
//     instance.registerFactory<StoreDetailsViewModel>(
//         () => StoreDetailsViewModel(instance()));
//   }
// }
