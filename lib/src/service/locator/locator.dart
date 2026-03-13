import 'package:get_it/get_it.dart';

import '../network/api_client.dart';
import '../routes/navigation_service.dart';
import '../local_storage/local_storage_service.dart';
import '../../controller/local_storage_controller.dart';
import '../../modules/home/bloc/home_bloc.dart';

/// Global [GetIt] service locator instance.
final GetIt serviceLocator = GetIt.instance;

/// Convenience accessor for [NavigationService].
NavigationService get navigationServiceInst =>
    serviceLocator<NavigationService>();

/// Registers all services, controllers, and blocs with [GetIt].
///
/// Must be called once during app initialization (in `main.dart`)
/// before any service is resolved.
void setupLocator() {
  // ---------------------------------------------------------------------------
  // Core Services
  // ---------------------------------------------------------------------------

  serviceLocator.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );

  serviceLocator.registerLazySingleton<ApiClient>(
    () => ApiClient(),
  );

  serviceLocator.registerLazySingleton<LocalStorageService>(
    () => LocalStorageService(),
  );

  // ---------------------------------------------------------------------------
  // Controllers
  // ---------------------------------------------------------------------------

  serviceLocator.registerLazySingleton<LocalStorageController>(
    () => LocalStorageController(serviceLocator<LocalStorageService>()),
  );

  // ---------------------------------------------------------------------------
  // Feature Blocs
  // ---------------------------------------------------------------------------

  serviceLocator.registerFactory<HomeBloc>(
    () => HomeBloc(),
  );
}
