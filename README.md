## Pulse Monitor App
A professional, reactive sensor monitoring application built with Flutter, Riverpod, and Firebase. This project demonstrates a production-ready approach to handling real-time data, complex navigation, and push notification-driven workflows.

## Key Features

* Reactive State Management: Utilizes Riverpod’s AsyncNotifier to cleanly handle loading, error, and success states for sensor data.

* Deep-Link Integrated Navigation: Implements go_router for a centralized, type-safe navigation system that supports external triggers.

* Push Notification Lifecycle: A robust PushNotificationService that handles incoming messages both in the background and foreground, automatically navigating users to the correct sensor zone.

* Adaptive UI: Features a modern, card-based interface with automated error handling and recovery states.

## Tech Stack
* Language: Dart / Flutter

* State Management: Flutter Riverpod

* Navigation: Go Router

* Backend/Messaging: Firebase Cloud Messaging (FCM)

* Code Generation: riverpod_generator

## Architecture Insights
The app follows a service-oriented architecture:

* Notification Layer: Encapsulated in a PushNotificationService to decouple OS-level notification logic from the application UI.

* Navigation Layer: Centralized with go_router, allowing for seamless deep-linking to specific zones from push notifications.

* Data Layer: Leverages AsyncNotifier to ensure the UI is always in sync with the backend state, providing a Single Source of Truth.

## Setup
1. Clone the repository:

``` git clone https://github.com/yourusername/pulse_monitor.git```

2. Install dependencies:

```flutter pub get```

3. Configure Firebase:
Run the following command to generate your firebase_options.dart:

```flutterfire configure```

Note: Remember to add your own google-services.json (Android) and GoogleService-Info.plist (iOS) files to the respective platform directories.

Generate Code:

```dart run build_runner build --delete-conflicting-outputs```
