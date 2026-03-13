import 'package:shared_preferences/shared_preferences.dart';

/// Wrapper around [SharedPreferences] for typed local storage access.
///
/// Provides get/set methods for common data types.
/// Register as a lazy singleton in the service locator.
class LocalStorageService {
  /// Variables
  SharedPreferences? _prefs;

  // ---------------------------------------------------------------------------
  // [LocalStorageService] initialization
  // ---------------------------------------------------------------------------

  /// Initializes the [SharedPreferences] instance.
  ///
  /// Must be called before any get/set operations.
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Internal getter that enforces initialization validation.
  SharedPreferences get _safePrefs {
    if (_prefs == null) {
      throw StateError('LocalStorageService.init() must be called before use');
    }
    return _prefs!;
  }

  // ---------------------------------------------------------------------------
  // [LocalStorageService] methods
  // ---------------------------------------------------------------------------

  /// Stores a [value] string under the given [key].
  Future<bool> setString(String key, String value) async {
    return await _safePrefs.setString(key, value);
  }

  /// Retrieves the string stored under [key], or `null` if absent.
  String? getString(String key) {
    return _safePrefs.getString(key);
  }

  /// Stores a [value] boolean under the given [key].
  Future<bool> setBool(String key, bool value) async {
    return await _safePrefs.setBool(key, value);
  }

  /// Retrieves the boolean stored under [key], or `null` if absent.
  bool? getBool(String key) {
    return _safePrefs.getBool(key);
  }

  /// Stores a [value] integer under the given [key].
  Future<bool> setInt(String key, int value) async {
    return await _safePrefs.setInt(key, value);
  }

  /// Retrieves the integer stored under [key], or `null` if absent.
  int? getInt(String key) {
    return _safePrefs.getInt(key);
  }

  /// Removes the value stored under [key].
  Future<bool> remove(String key) async {
    return await _safePrefs.remove(key);
  }

  /// Clears all stored key-value pairs.
  Future<bool> clear() async {
    return await _safePrefs.clear();
  }
}
