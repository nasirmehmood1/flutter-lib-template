# Flutter General Template

A production-ready **GitHub Template Repository** for starting new Flutter projects with a clean, scalable architecture.

## 🚀 How to Use This Template

1. Click the **"Use this template"** button at the top of this repository on GitHub.
2. Enter your new repository name and create it.
3. Clone your new repository locally.
4. Run the setup commands below.

## 📦 Setup

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 🏗️ Architecture Overview

This template follows a **modular feature-based architecture** combined with core services:

```
lib/
├── src/
│   ├── application/     App-level configs (base_state.dart)
│   ├── controller/      Global controllers (local_storage_controller.dart)
│   ├── models/          Global data models (api_model.dart)
│   ├── modules/         Feature modules (home/, login/, etc.)
│   ├── service/         Core services (network, locator, routes, local_storage)
│   ├── theme/           App themes, colors, text styles
│   ├── utils/           Constants, helpers, enums, validators
│   ├── widgets/         Global reusable widgets
│   └── main_activity.dart
├── main.dart
```

### Feature Module Structure

Each feature inside `lib/src/modules/` follows this structure:

```
module_name/
├── bloc/       State management (bloc, event, state)
├── models/     Feature-specific models
├── view/       Main UI screens
└── widgets/    Feature-specific UI components (Mixins)
```

## 📚 Packages Used

| Package | Purpose |
|---|---|
| `flutter_bloc` / `bloc` | State management (BLoC pattern) |
| `equatable` | Value equality for BLoC states & events |
| `get_it` | Dependency injection / service locator |
| `flutter_screenutil` | Responsive UI sizing |
| `http` | HTTP networking |
| `shared_preferences` | Persistent local storage |

## 🔧 Key Patterns

- **Service Locator** — All services and blocs registered in `lib/src/service/locator/locator.dart`
- **Centralized Navigation** — Use `NavigationService` instead of direct `Navigator.push`
- **BaseState** — Extend `BaseState<T>` instead of `State<T>` for consistent screen scaffolding
- **Mixin Widgets** — Complex UI components extracted to mixins (e.g., `HomeViewWidgets`)
- **ApiClient** — All HTTP calls through a centralized client with standardized error handling

## 📝 Adding a New Feature

1. Create a new folder under `lib/src/modules/your_feature/`
2. Add `bloc/`, `view/`, and `widgets/` sub-folders
3. Register the new BLoC in `locator.dart`
4. Add the route to `enums.dart` and `router.dart`
5. Build the UI using `BaseState` + mixin pattern

## 📄 License

This project is open source. Feel free to use it as a starting point for your Flutter projects.
