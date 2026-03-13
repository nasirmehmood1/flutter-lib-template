# Flutter Project Generation Prompt Template

When generating a new Flutter project or adding new features to an existing one, please STRICTLY follow the architectural patterns, folder structure, and package usage defined below.

## 1. Folder Structure & Architecture
The project follows a modular feature-based architecture combined with core services.

```text
lib/
├── src/
│   ├── application/     (App-level configs, e.g., flavor_config.dart, base_state.dart)
│   ├── controller/      (Global controllers, e.g., local_storage_controller.dart)
│   ├── models/          (Global data models)
│   ├── modules/         (Feature modules: home, login, etc.)
│   ├── service/         (Core services: network, locator, routes, local_storage)
│   ├── theme/           (App themes, colors, text styles)
│   ├── utils/           (Constants, helpers, enums, validators)
│   ├── widgets/         (Global reusable widgets)
│   └── main_activity.dart
├── main.dart
```

Each feature inside `lib/src/modules/` should have its own structure:
```text
module_name/
├── bloc/                (State management files: bloc, event, state)
├── models/              (Feature-specific models)
├── view/                (Main UI screens)
└── widgets/             (Feature-specific UI components, often as Mixins)
```

## 2. Core Packages & Tooling
Ensure you utilize the following packages for their respective responsibilities:
- **State Management:** `flutter_bloc`, `bloc`, `equatable`
- **Dependency Injection:** `get_it`
- **Responsiveness:** `flutter_screenutil`
- **Networking/API:** `http`
- **Local Storage:** `shared_preferences`

## 3. Dependency Injection (Locator)
All blocs, controllers, and singleton services must be registered in the `GetIt` service locator (e.g., `lib/src/service/locator/locator.dart`).
- Register services as `LazySingleton`.
- Register feature blocs as `LazySingleton` or `Factory` depending on usage lifecycle.

*Example Usage:*
```dart
final GetIt serviceLocator = GetIt.instance;
serviceLocator.registerLazySingleton<NavigationService>(() => NavigationService());
serviceLocator.registerFactory<LoginBloc>(() => LoginBloc());
```

## 4. Navigation & Routing
Do NOT use direct `Navigator.push`. Use the centralized `NavigationService`.
- Define all routes in an `enum Routes` (`lib/src/utils/enums.dart`).
- Map these route names to screen widgets inside `lib/src/service/routes/router.dart`.
- Trigger navigation via the `navigationServiceInst` instance resolved from `GetIt`.

*Example Usage:*
```dart
navigationServiceInst.navigateTo(Routes.homeView.name);
navigationServiceInst.navigateBack();
```

## 5. Screen Responsiveness & UI Building
- Use **`flutter_screenutil`** (`.h`, `.w`, `.sp`, `.r`) for all padding, sizing, and typography to maintain responsiveness across screens.
- Avoid passing massive widget trees in a single `build` method.
- State-based views must extend a generalized `BaseState` rather than standard `State` directly (if applicable) and utilize `BlocListener` / `BlocBuilder` to react to state changes.
- Complex UI components for a screen should be moved to a Mixin file (e.g., `mixin LoginViewWidgets`) and mixed into the View's State class to keep the main view clean.

*Example Usage:*
```dart
class _LoginViewState extends BaseState<LoginView> with LoginViewWidgets {
  @override
  Widget buildBody(BuildContext context) {
    return BlocListener(...);
  }
}
```

## 6. API Client & Networking
API requests should be handled by a centralized `ApiClient` (`lib/src/service/network/api_client.dart`).
- It should use standard HTTP verbs (`getRequest`, `postRequest`, etc.).
- Errors (like `SocketException`) should be caught and transformed into a generic `ApiModel` response object indicating failure.
- API endpoints should be stored inside `lib/src/utils/api_endpoints.dart`.

*Example Usage:*
```dart
final response = await serviceLocator<ApiClient>().postRequest(
  uri: Uri.parse(ApiEndpoints.login),
  requestBody: {"email": email},
);
```

## 7. Coding Style & Documentation
To maintain consistency, follow these structural and stylistic guidelines for classes:
- **Documentation Comments**: Use `///` for documenting classes, methods, and blocs. Briefly explain the purpose of the class or the entry point.
- **Section Dividers**: Separate different parts of a class using commented section dividers like `/// Variables`, `/// View`, `/// Getters`, and `/// [ClassName] methods`.
- **Private Variables/Methods**: Prefix internal variables and helper methods with an underscore `_`.
- **Typing**: Always explicitly define types for variables and method return types when possible.

*Example Usage:*
```dart
class CallBloc extends Bloc<CallEvent, CallState> {
  /// Variables
  bool _isLoading = false;

  /// Getters
  bool get isLoadingStarts => _isLoading;

  /// [CallBloc] event handlers
  CallBloc() : super(CallScreenInitialState()) {
    on<CallEvent>(_onEvent);
  }

  /// [CallBloc] methods
  void _onEvent(CallEvent event, Emitter<CallState> emit) { ... }
}
```

## 8. Instructions for AI Code Generation
When instructed to build a new feature or replicate this project:
1. Always add new dependencies to `pubspec.yaml` following the standard.
2. Generate all the necessary boilerplate (Bloc files, module folders).
3. Register the new Bloc or Service in `locator.dart`.
4. Add the new Screen route to `enums.dart` and `router.dart`.
5. Create UI using `flutter_screenutil` extensions and abstract components to a Mixin.
6. Only do API calls inside the Bloc using the registered `ApiClient`.

**By following these rules exactly, you will ensure a completely matching architectural style and maintainable codebase.**
