/// Environments supported by the application.
enum Flavor { dev, staging, prod }

/// Handles environment-specific configuration values.
class FlavorConfig {
  FlavorConfig._();

  static Flavor _flavor = Flavor.dev;

  /// Gets the currently active application flavor.
  static Flavor get currentFlavor => _flavor;

  /// Sets the application flavor (should be called in `main.dart` variants).
  static void setFlavor(Flavor flavor) => _flavor = flavor;

  /// Retrieves the base URL specific to the current active flavor.
  static String get baseUrl => switch (_flavor) {
        Flavor.dev => 'https://dev-api.example.com',
        Flavor.staging => 'https://staging-api.example.com',
        Flavor.prod => 'https://api.example.com',
      };
}
