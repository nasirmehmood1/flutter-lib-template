import 'package:flutter/material.dart';

import 'src/main_activity.dart';
import 'src/service/locator/locator.dart';
import 'src/service/local_storage/local_storage_service.dart';

/// Application entry point.
///
/// Initializes core services (binding, service locator, local storage)
/// before running the root [MainActivity] widget.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register all services, controllers, and blocs.
  setupLocator();

  // Initialize local storage.
  await serviceLocator<LocalStorageService>().init();

  runApp(const MainActivity());
}
