import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerServices {
  /// Service class to handle permissions for the UCast Mobile application.
  ///
  /// This class provides methods to request permissions for various features
  /// like camera, location etc. It also includes functionality to open the
  /// app settings if the permissions are denied or restricted.
  PermissionHandlerServices();

  /// Requests microphone permission from the user for the UCast Mobile application.
  ///
  /// Based on the permission status, it returns a boolean indicating whether
  /// the permission was granted or not.
  Future<bool> takeMicrophonePermission() async {
    PermissionStatus permissionStatus = await Permission.microphone.request();
    return _checkPermissionStatus(permissionStatus);
  }

  /// Requests camera permission from the user for the UCast Mobile application.
  ///
  /// Based on the permission status, it returns a boolean indicating whether
  /// the permission was granted or not.
  Future<bool> takeCameraPermission() async {
    PermissionStatus permissionStatus = await Permission.camera.request();
    return _checkPermissionStatus(permissionStatus);
  }

  /// Checks the current status of a requested permission.
  ///
  /// This method evaluates the [PermissionStatus] value and returns `true`
  /// if the permission is granted, or `false` if the permission is denied,
  /// restricted, or in a limited state.
  bool _checkPermissionStatus(PermissionStatus value) {
    switch (value) {
      case PermissionStatus.denied:
        return false;
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.restricted:
        return false;
      case PermissionStatus.limited:
        return true;
      case PermissionStatus.permanentlyDenied:
        return false;
      case PermissionStatus.provisional:
        return false;
    }
  }

  /// Opens the app settings page.
  ///
  /// This method opens the app settings on the device, allowing the user
  /// to manually change the app's permission settings.
  Future<void> openSettings() async {
    await openAppSettings();
  }

  /// Getter for microphone permission
  Future<bool> get isMicrophoneGranted async =>
      await Permission.microphone.status == PermissionStatus.granted;
}
