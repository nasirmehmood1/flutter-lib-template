import '../application/flavor_config.dart';

/// Centralized API endpoint URL constants.
///
/// All endpoint paths should be defined here as static constants
/// to avoid scattering URL strings across the codebase.
class ApiEndpoints {
  ApiEndpoints._();

  /// Base URL for the API server.
  /// Automatically determined based on the active [Flavor].
  static String get baseUrl => FlavorConfig.baseUrl;

  // -------------------------------------------------------------------------
  // Auth Endpoints
  // -------------------------------------------------------------------------

  /// Login endpoint.
  static final String login = '$baseUrl/auth/login';

  /// Register endpoint.
  static final String register = '$baseUrl/auth/register';

  // -------------------------------------------------------------------------
  // User Endpoints
  // -------------------------------------------------------------------------

  /// Fetch user profile.
  static final String userProfile = '$baseUrl/user/profile';
}
