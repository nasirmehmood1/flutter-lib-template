import '../controller/local_storage_controller.dart';
import '../models/api_model.dart';
import '../service/locator/locator.dart';

/// App-wide constant values.
///
/// Centralized location for magic strings and configuration values
/// used throughout the application.

  /// Application name displayed in the UI.
   String appName = 'Flutter General Template';

  /// Default network request timeout duration in seconds.
   int defaultTimeout = 30;

  /// Default page size for paginated API responses.
   int defaultPageSize = 20;

  ApiModel defaultSocketErrorMap(String message) =>
      ApiModel(status: 503, message: message);

  Map<String, String> get generalApiHeader => {
    //'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
    'Bearer ${serviceLocator<LocalStorageController>()}',
    // 'User-Agent': 'UCast'
  };

ApiModel get defaultServerErrorMap =>
    ApiModel(status: 500, message: 'commonErrorText');

String get generalApiError =>
    "An error occurred while requesting from the server";


/// Screen Height and Width

set setScreenHeight(double height) => _screenHeight = height;

set setScreenWidth(double width) => _screenWidth = width;

double _screenHeight = 0;

double _screenWidth = 0;

double get screenHeight => _screenHeight;

double get screenWidth => _screenWidth;




