
import '../service/local_storage/local_storage_service.dart';

/// High-level controller for app-specific local storage operations.
///
/// Wraps [LocalStorageService] with domain-aware methods
/// (e.g., auth token, onboarding status).
class LocalStorageController {
  /// Variables
  final LocalStorageService _storageService;

  /// Storage keys
  static const String _keyAuthToken = 'auth_token';
  static const String _keyIsFirstLaunch = 'is_first_launch';

  /// Creates a [LocalStorageController] with the given [LocalStorageService].
  LocalStorageController(this._storageService);

  // ---------------------------------------------------------------------------
  // [LocalStorageController] methods
  // ---------------------------------------------------------------------------

  /// Saves the user's authentication [token].
  Future<bool> saveAuthToken(String token) {
    return _storageService.setString(_keyAuthToken, token);
  }

  /// Retrieves the stored authentication token, or `null` if not set.
  String? getAuthToken() {
    return _storageService.getString(_keyAuthToken);
  }

  /// Removes the stored authentication token (e.g., on logout).
  Future<bool> clearAuthToken() {
    return _storageService.remove(_keyAuthToken);
  }

  /// Returns `true` if this is the user's first app launch.
  bool isFirstLaunch() {
    return _storageService.getBool(_keyIsFirstLaunch) ?? true;
  }

  /// Marks the first launch as completed.
  Future<bool> setFirstLaunchCompleted() {
    return _storageService.setBool(_keyIsFirstLaunch, false);
  }

  /// Clears all local storage (e.g., on account deletion).
  Future<bool> clearAll() {
    return _storageService.clear();
  }
}
