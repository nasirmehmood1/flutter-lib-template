# Flutter General Template

A production-ready **GitHub Template Repository** for starting new Flutter projects with a clean, scalable architecture.

This template provides a structured foundation for building Flutter applications using modular architecture, centralized services, and reusable UI components.

---

# 🚀 How to Use This Template

1. Click the **"Use this template"** button at the top of this repository on GitHub.
2. Enter your new repository name and create it.
3. Clone your new repository locally.
4. Run the setup commands below.

---

# ⚠️ Initial Customization (Important)

Before starting development, customize the project to match your product’s branding and design system.

### 🎨 Color Scheme

Update your project’s colors inside:

```
lib/src/theme/
```

Modify the following:

- Primary color
- Secondary color
- Background colors
- Button colors
- Accent colors

This ensures UI consistency across the entire application.

---

### 🔤 Fonts

Replace the default font with your project font.

1. Add your fonts inside:# Flutter General Template

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


```
assets/fonts/
```

2. Register fonts in **pubspec.yaml**

```yaml
fonts:
  - family: YourFontName
    fonts:
      - asset: assets/fonts/YourFont-Regular.ttf
```

3. Apply the font inside:

```
lib/src/theme/
```

---

### 📝 Text Colors & Styles

Update global typography settings inside:

```
lib/src/theme/text_styles.dart
```

Customize:

- Headings
- Body text
- Buttons
- Captions
- Default text colors

This ensures consistent typography across the app.

---

# 📦 Setup

Run the following commands:

```bash
# Install dependencies
flutter pub get

# Run the application
flutter run
```

---

# 🏗️ Architecture Overview

This template follows a **modular feature-based architecture** combined with core services.

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

---

# 📦 Feature Module Structure

Each feature inside:

```
lib/src/modules/
```

follows this structure:

```
module_name/
├── bloc/       State management (bloc, event, state)
├── models/     Feature-specific models
├── view/       Main UI screens
└── widgets/    Feature-specific UI components (Mixins)
```

---

# 📚 Packages Used

| Package | Purpose |
|--------|--------|
| flutter_bloc / bloc | State management using the BLoC pattern |
| equatable | Value equality for BLoC states and events |
| get_it | Dependency injection / service locator |
| flutter_screenutil | Responsive UI sizing |
| http | HTTP networking |
| shared_preferences | Persistent local storage |

---

# 🔧 Key Patterns

### Service Locator

All services and BLoCs are registered inside:

```
lib/src/service/locator/locator.dart
```

This enables dependency injection across the application.

---

### Centralized Navigation

Use **NavigationService** instead of direct `Navigator.push`.

This keeps navigation logic centralized and easier to maintain.

---

### BaseState

Extend:

```
BaseState<T>
```

instead of `State<T>` to provide consistent screen scaffolding across all pages.

---

### Mixin Widgets

Complex UI widgets are extracted into mixins to keep screens clean and maintainable.

Example:

```
HomeViewWidgets
```

---

### ApiClient

All HTTP calls should go through a centralized API client to maintain consistent request handling and error management.

---

# 📝 Adding a New Feature

1. Create a new folder inside:

```
lib/src/modules/
```

Example:

```
lib/src/modules/profile/
```

2. Add the following folders:

```
bloc/
models/
view/
widgets/
```

3. Register the BLoC in:

```
locator.dart
```

4. Add the route inside:

```
router.dart
```

5. Build the UI using:

- `BaseState`
- Mixin widget pattern
