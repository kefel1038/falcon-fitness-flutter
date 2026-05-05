# Falcon Fitness - Flutter iOS App

A Flutter-based iOS application converted from the Next.js Falcon Fitness app.

## Features

- **Authentication**: Login/Register with mock credentials
- **Dashboard**: Membership status, quick actions, upcoming classes
- **Class Booking**: Browse and book fitness classes
- **Workout Library**: Filterable workout programs with categories
- **Personal Training**: Browse trainers and book sessions
- **Progress Tracking**: Weight tracking and body measurements
- **Branch Locations**: Find gym locations in Qatar
- **Community**: Challenges and social feed
- **Profile**: User settings and membership management

## Demo Credentials

- Admin: admin@falcon.com / admin123
- Gold Member: gold@falcon.com / gold123
- Silver Member: silver@falcon.com / silver123

## Getting Started

1. Ensure Flutter is installed (>=3.0.0)
2. Run `flutter pub get`
3. Connect iOS device or simulator
4. Run `flutter run`

## iOS Deployment

1. Open `ios/Runner.xcworkspace` in Xcode
2. Configure signing with your Apple Developer account
3. Build and run on iOS device

## Project Structure

```
lib/
├── main.dart           # App entry point
├── models/             # Data models
├── services/           # API and storage services
└── screens/           # App screens
```

## Dependencies

- flutter_lucide: Icons
- google_fonts: Outfit font
- shared_preferences: Local storage
