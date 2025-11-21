# 📱 Event Booking App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.7.2-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.7.2-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-Latest-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey?style=for-the-badge)

**A modern, full-featured event booking platform built with Flutter & Firebase**

[Features](#-features) • [Demo](#-demo--screenshots) • [Installation](#-installation) • [Architecture](#%EF%B8%8F-architecture--technical-deep-dive) • [Roadmap](#-roadmap)

</div>

---

## 📋 Table of Contents

- [🌟 Overview](#-overview)
- [✨ Features](#-features)
- [📱 Demo & Screenshots](#-demo--screenshots)
- [🚀 Quick Start](#-quick-start)
- [📦 Installation](#-installation)
- [💻 Usage](#-usage)
- [🏗️ Architecture & Technical Deep Dive](#%EF%B8%8F-architecture--technical-deep-dive)
- [🔥 Key Technical Highlights](#-key-technical-highlights)
- [🛠️ Development](#%EF%B8%8F-development)
- [📚 API Documentation](#-api-documentation)
- [🧪 Testing](#-testing)
- [🗺️ Roadmap](#-roadmap)
- [🤝 Contributing](#-contributing)
- [🙏 Acknowledgments](#-acknowledgments)

---

## 🌟 Overview

**Event Booking App** is an enterprise-grade, production-ready mobile application that revolutionizes event discovery and booking. Built with Flutter's latest features and Firebase backend, this app delivers a seamless experience for discovering, booking, and managing events with real-time synchronization across all devices.

### 🎯 Purpose

This application solves the fragmented event discovery problem by providing a unified platform where users can:
- **Discover** trending events based on interests and location
- **Connect** with event organizers and like-minded attendees
- **Book** tickets with guaranteed capacity management
- **Communicate** via real-time chat with organizers and participants
- **Manage** bookings, favorites, and social connections

### 👥 Target Audience

| Audience | Use Case |
|----------|----------|
| **Event Organizers** | Create, manage, and promote events with built-in attendee management |
| **Event Seekers** | Discover local events, book tickets, and connect with communities |
| **Social Users** | Follow favorite organizers and stay updated on new events |
| **Professionals** | Network at tech conferences, workshops, and industry meetups |

### 🎨 Design Philosophy

- **Real-time First** - Firestore snapshots provide live updates without polling
- **Offline-Ready** - Local caching enables browsing and booking offline
- **Security-Conscious** - Email verification, atomic transactions, and Firebase Auth
- **Location-Aware** - Google Maps integration for venue discovery
- **Social by Design** - Follow, chat, and notification systems foster community

---

## ✨ Features

### 🔐 Authentication & Security
- ✅ **Email/Password Authentication** - Firebase Auth with email verification enforcement
- ✅ **Google Sign-In** - One-tap OAuth 2.0 login with auto profile creation
- ✅ **Email Verification** - OTP-style verification with 60-second resend timer
- ✅ **Password Reset** - Self-service password recovery via email
- ✅ **Session Management** - Remember Me with secure local storage

### 🎪 Event Discovery & Management
- ✅ **Home Feed** - Trending and upcoming events with real-time updates
- ✅ **Category Filters** - Sports, Tech, Music, Food, Art with color-coded navigation
- ✅ **Advanced Search** - Autocomplete-style partial matching with prefix arrays
- ✅ **Multi-Criteria Filtering** - Price range, location, date, and category filters
- ✅ **Event Creation** - Rich form with image upload and location picker
- ✅ **Google Maps Integration** - Interactive location picker with drag-and-drop markers
- ✅ **Reverse Geocoding** - Auto-fill addresses from coordinates
- ✅ **My Events Dashboard** - Manage created events with edit/delete capabilities

### 🎟️ Booking System
- ✅ **Atomic Bookings** - Firestore transactions prevent double-booking race conditions
- ✅ **Capacity Management** - Real-time attendee tracking with "Event Full" prevention
- ✅ **Ticket Generation** - Unique ticket numbers for booking confirmation
- ✅ **Payment Flow** - Payment method selection with booking confirmation
- ✅ **Booking History** - View all bookings with status tracking (Confirmed/Cancelled/Completed)
- ✅ **Cancellation System** - One-tap booking cancellation with refund logic

### 💬 Real-time Communication
- ✅ **Direct Messaging** - Real-time chat with Firestore snapshots (no WebSockets needed)
- ✅ **Read Receipts** - Message read/unread status tracking
- ✅ **Unread Badges** - Visual indicators for new messages
- ✅ **Conversation History** - Persistent message storage with timestamps
- ✅ **Auto-Scroll** - Smart scrolling to latest messages

### 🔔 Notification System
- ✅ **Real-time Notifications** - Firestore streams for instant updates
- ✅ **Notification Types** - Bookings, Follows, Messages with rich metadata
- ✅ **Unread Count Badges** - App bar indicators for pending notifications
- ✅ **Batch Actions** - Mark all as read with single tap
- ✅ **Notification Center** - Dedicated view for all notifications

### 👥 Social Features
- ✅ **Follow System** - Follow/unfollow organizers and users
- ✅ **Follower Counts** - Real-time follower/following statistics
- ✅ **Organizer Profiles** - Dedicated profiles with events, bio, and reviews
- ✅ **User Profiles** - Editable profiles with photo, bio, and location
- ✅ **Social Proof** - Attendee avatars and counts on event pages

### 📍 Location Features
- ✅ **GPS Location Access** - Current location with permission handling
- ✅ **Location Picker** - Interactive map for precise venue selection
- ✅ **Address Autocomplete** - Reverse geocoding displays addresses automatically
- ✅ **GeoPoint Storage** - Coordinates stored for future proximity queries
- ✅ **Distance Calculation** - Built-in distance calculation utilities

### 🎨 UI/UX Excellence
- ✅ **Material Design 3** - Modern, polished interface
- ✅ **Custom Typography** - Poppins font family for enhanced readability
- ✅ **Color-Coded Categories** - Visual organization with distinct color themes
- ✅ **Shimmer Loading** - Skeleton screens for perceived performance
- ✅ **Cached Images** - Lightning-fast image loading with automatic caching
- ✅ **Responsive Design** - Adaptive layouts for all screen sizes
- ✅ **Bottom Navigation** - Intuitive tab-based navigation
- ✅ **Drawer Menu** - Quick access to all app features

### 🚀 Advanced Technical Features
- ✅ **Clean Architecture** - 280+ files organized by feature with clear separation
- ✅ **BLoC State Management** - Predictable, testable state across 15+ Cubits
- ✅ **Repository Pattern** - Abstract data layer for easy backend migration
- ✅ **Either/Result Pattern** - Functional error handling with Dartz
- ✅ **Dependency Injection** - GetIt service locator for loose coupling
- ✅ **Firebase Transactions** - ACID guarantees for critical operations
- ✅ **Batch Writes** - Atomic multi-document updates for consistency
- ✅ **Stream-Based UI** - Reactive interfaces with Firestore snapshots
- ✅ **Offline Support** - Firestore caching enables offline browsing
- ✅ **Cross-Platform** - Single codebase for Android, iOS, Web, Windows, macOS, Linux

---

## 📱 Demo & Screenshots

### 🎥 Video Demo
> **Coming Soon** - Full feature walkthrough video will be posted here

### 📸 Screenshots

<div align="center">

| Authentication | Home Feed | Event Details |
|:--------------:|:---------:|:-------------:|
| *Login & Sign Up* | *Discover Events* | *Event Information* |

| Event Creation | Google Maps | Chat |
|:--------------:|:-----------:|:----:|
| *Create New Event* | *Location Picker* | *Real-time Messaging* |

| Booking Flow | Notifications | Profile |
|:------------:|:-------------:|:-------:|
| *Book Tickets* | *Stay Updated* | *User Profile* |

</div>

---

## 🚀 Quick Start

Get up and running in **5 minutes**:

```bash
# Clone the repository
git clone https://github.com/yourusername/event_booking_app.git

# Navigate to project directory
cd event_booking_app

# Install dependencies
flutter pub get

# Run the app
flutter run
```

> **Note**: Firebase configuration required. See [Installation](#-installation) for full setup.

---

## 📦 Installation

### Prerequisites

Before you begin, ensure you have the following installed:

| Requirement | Version | Installation Guide |
|-------------|---------|-------------------|
| **Flutter SDK** | ≥3.7.2 | [Install Flutter](https://flutter.dev/docs/get-started/install) |
| **Dart SDK** | ≥3.7.2 | Included with Flutter |
| **Firebase CLI** | Latest | [Install Firebase CLI](https://firebase.google.com/docs/cli) |
| **IDE** | Any | Android Studio, VS Code, or IntelliJ IDEA |

**Platform-specific requirements:**
- **Android**: Android Studio with Android SDK (API 21+)
- **iOS**: Xcode 13+ (macOS only)
- **Web**: Chrome browser
- **Desktop**: Platform-specific toolchain

### Installation Steps

#### 1️⃣ Clone the Repository

```bash
git clone https://github.com/yourusername/event_booking_app.git
cd event_booking_app
```

#### 2️⃣ Install Dependencies

```bash
flutter pub get
```

#### 3️⃣ Firebase Setup

**A. Create Firebase Project**
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add Project"
3. Follow the setup wizard

**B. Enable Firebase Services**
- **Authentication**: Enable Email/Password and Google Sign-In
- **Firestore**: Create database in production mode
- **Storage**: Enable Firebase Storage for image uploads

**C. Configure Firebase for Each Platform**

**Android:**
```bash
# Download google-services.json from Firebase Console
# Place it in: android/app/google-services.json
```

**iOS:**
```bash
# Download GoogleService-Info.plist from Firebase Console
# Place it in: ios/Runner/GoogleService-Info.plist
```

**Web:**
```bash
# Copy Firebase config and add to web/index.html
```

#### 4️⃣ Google Maps Setup

**A. Get Google Maps API Key**
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Enable Maps SDK for Android/iOS
3. Enable Geocoding API

**B. Configure API Keys**

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_ANDROID_API_KEY"/>
```

**iOS** (`ios/Runner/AppDelegate.swift`):
```swift
GMSServices.provideAPIKey("YOUR_IOS_API_KEY")
```

#### 5️⃣ Verify Installation

```bash
# Check Flutter installation
flutter doctor

# Verify Firebase connection
flutterfire configure

# Check connected devices
flutter devices
```

#### 6️⃣ Run the Application

```bash
# Development mode (with hot reload)
flutter run

# Release mode
flutter run --release

# Specific platforms
flutter run -d android
flutter run -d ios
flutter run -d chrome
flutter run -d windows
```

### 🔧 Firestore Security Rules

Add these security rules to your Firestore:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection
    match /users/{userId} {
      allow read: if true;
      allow write: if request.auth.uid == userId;
    }

    // Events collection
    match /events/{eventId} {
      allow read: if true;
      allow create: if request.auth != null;
      allow update: if request.auth.uid == resource.data.publisherId;
      allow delete: if request.auth.uid == resource.data.publisherId;
    }

    // Bookings collection
    match /bookings/{bookingId} {
      allow read: if request.auth.uid == resource.data.userId;
      allow create: if request.auth != null;
      allow update: if request.auth.uid == resource.data.userId;
    }

    // Messages subcollection
    match /conversations/{conversationId}/messages/{messageId} {
      allow read: if request.auth.uid in resource.data.participantIds;
      allow create: if request.auth != null;
    }

    // Notifications collection
    match /notifications/{notificationId} {
      allow read: if request.auth.uid == resource.data.userId;
      allow create: if request.auth != null;
    }
  }
}
```

### 📊 Firestore Indexes

Create these composite indexes for optimal performance:

```javascript
// Events collection
events:
  - category (Ascending) + date (Ascending)
  - publisherId (Ascending) + date (Descending)

// Bookings collection
bookings:
  - userId (Ascending) + bookingDate (Descending)
  - eventId (Ascending) + status (Ascending)

// Conversations collection
conversations:
  - participantIds (Array) + lastMessageTime (Descending)

// Notifications collection
notifications:
  - userId (Ascending) + createdAt (Descending)
  - userId (Ascending) + isRead (Ascending)
```

---

## 💻 Usage

### Basic Usage

#### 🔐 Authentication Flow

```dart
// Register with Email/Password
await authRepo.register(
  email: 'user@example.com',
  password: 'securePassword123',
);

// Login with Email/Password
await authRepo.login(
  email: 'user@example.com',
  password: 'securePassword123',
);

// Google Sign-In
await googleSignInCubit.signInWithGoogle();
```

#### 🎪 Creating an Event

```dart
// Submit event with all details
await createEventCubit.submitEvent(
  title: 'Flutter Conference 2025',
  description: 'Annual Flutter developers conference',
  location: 'Cairo, Egypt',
  subLocation: 'Cairo International Convention Center',
  category: 'Tech',
  date: DateTime(2025, 6, 15),
  image: selectedImageFile,
  price: '500',
  maxCapacity: '1000',
  locationCoordinates: GeoPoint(30.0444, 31.2357),
);
```

#### 🎟️ Booking an Event

```dart
// Book event with atomic transaction
await bookingRepo.bookEvent(
  userId: currentUser.uid,
  eventId: selectedEvent.id,
  price: selectedEvent.price,
);
```

#### 💬 Sending a Message

```dart
// Send real-time message
await messagingRepo.sendMessage(
  senderId: currentUser.uid,
  receiverId: organizer.uid,
  content: 'Looking forward to this event!',
  type: MessageType.text,
);
```

#### 📍 Getting Location

```dart
// Get current location with address
final result = await locationService.getCurrentLocationWithAddress();

result.fold(
  (failure) => print(failure.errMessage),
  (data) {
    print('Address: ${data['address']}');
    print('Coordinates: ${data['coordinates']}');
  },
);
```

---

## 🏗️ Architecture & Technical Deep Dive

### Technology Stack

<table>
<tr>
<th>Layer</th>
<th>Technology</th>
<th>Purpose</th>
<th>Benefits</th>
</tr>
<tr>
<td><strong>Frontend</strong></td>
<td>Flutter 3.7.2</td>
<td>Cross-platform UI framework</td>
<td>Single codebase, 60 FPS, native performance</td>
</tr>
<tr>
<td><strong>Language</strong></td>
<td>Dart 3.7.2</td>
<td>Application logic</td>
<td>AOT/JIT compilation, null safety, modern syntax</td>
</tr>
<tr>
<td><strong>State Management</strong></td>
<td>flutter_bloc 9.1.1</td>
<td>BLoC/Cubit pattern</td>
<td>Predictable, testable, scalable state</td>
</tr>
<tr>
<td><strong>Backend</strong></td>
<td>Firebase</td>
<td>Backend-as-a-Service</td>
<td>Zero server ops, real-time sync, auto-scaling</td>
</tr>
<tr>
<td><strong>Authentication</strong></td>
<td>Firebase Auth 6.0.1</td>
<td>User authentication</td>
<td>Secure, OAuth 2.0, multi-provider</td>
</tr>
<tr>
<td><strong>Database</strong></td>
<td>Cloud Firestore 6.0.0</td>
<td>NoSQL database</td>
<td>Real-time, offline, scalable, indexed queries</td>
</tr>
<tr>
<td><strong>Storage</strong></td>
<td>Firebase Storage 13.0.0</td>
<td>File hosting</td>
<td>CDN delivery, automatic compression</td>
</tr>
<tr>
<td><strong>Maps</strong></td>
<td>google_maps_flutter 2.10.0</td>
<td>Interactive maps</td>
<td>Native performance, rich features</td>
</tr>
<tr>
<td><strong>Location</strong></td>
<td>geolocator 13.0.2</td>
<td>GPS services</td>
<td>Cross-platform, permission handling</td>
</tr>
<tr>
<td><strong>Geocoding</strong></td>
<td>geocoding 3.0.0</td>
<td>Address conversion</td>
<td>Forward/reverse geocoding, accurate</td>
</tr>
<tr>
<td><strong>Functional</strong></td>
<td>dartz 0.10.1</td>
<td>Either/Option patterns</td>
<td>Type-safe error handling, FP paradigms</td>
</tr>
<tr>
<td><strong>DI</strong></td>
<td>get_it 8.0.3</td>
<td>Service locator</td>
<td>Loose coupling, testable, no reflection</td>
</tr>
<tr>
<td><strong>Navigation</strong></td>
<td>go_router 16.0.0</td>
<td>Declarative routing</td>
<td>Deep linking, type-safe, web support</td>
</tr>
<tr>
<td><strong>UI Components</strong></td>
<td>Syncfusion Sliders 30.2.4</td>
<td>Professional widgets</td>
<td>Polished, customizable, performant</td>
</tr>
<tr>
<td><strong>Imaging</strong></td>
<td>cached_network_image 3.4.1</td>
<td>Image caching</td>
<td>Automatic caching, placeholders, fast loads</td>
</tr>
</table>

### Project Architecture

The app follows **Clean Architecture** principles with **Feature-Based Structure**:

```
lib/
├── core/                           # Shared/Global Code
│   ├── controllers/                # Global Cubits
│   │   └── current_user_cubit/     # Global user state
│   ├── models/                     # Domain Models
│   │   ├── event_model.dart        # Event entity
│   │   ├── user_model.dart         # User entity
│   │   ├── booking_model.dart      # Booking entity
│   │   ├── message_model.dart      # Message entity
│   │   └── conversation_model.dart # Conversation entity
│   ├── repositories/               # Repository Implementations
│   │   ├── event_repo/
│   │   ├── user_repo/
│   │   ├── booking_repo/
│   │   ├── messaging_repo/
│   │   ├── follow_repo/
│   │   └── bookmark_repo/
│   ├── services/                   # Utility Services
│   │   ├── location_service.dart   # GPS & Geocoding
│   │   └── shared_prefs_service.dart # Local storage
│   ├── widgets/                    # Reusable Widgets
│   ├── utils/                      # Utilities
│   ├── theme/                      # App Theming
│   ├── constants/                  # App Constants
│   └── di/                         # Dependency Injection
│
├── features/                       # Feature Modules
│   ├── auth/                       # Authentication
│   ├── home/                       # Home Feed
│   ├── create_event/               # Event Creation
│   ├── event_details/              # Event Details
│   ├── booking/                    # Booking System
│   ├── messaging/                  # Real-time Chat
│   ├── notification/               # Notifications
│   ├── search/                     # Search & Filters
│   ├── profile/                    # User Profile
│   └── organizer_profile/          # Organizer Profile
│
└── main.dart                       # App Entry Point
```

### Clean Architecture Layers

```
┌─────────────────────────────────────────────────────────┐
│                  Presentation Layer                      │
│  (UI Widgets, Cubits, State Management)                 │
│  ✓ User interactions                                     │
│  ✓ State emissions                                       │
│  ✓ UI rendering                                          │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                   Domain Layer                           │
│  (Business Logic, Entities, Use Cases)                  │
│  ✓ Business rules                                        │
│  ✓ Domain models                                         │
│  ✓ Repository interfaces                                 │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                    Data Layer                            │
│  (Repositories, Data Sources, APIs)                     │
│  ✓ Firestore operations                                  │
│  ✓ Firebase Auth                                         │
│  ✓ Firebase Storage                                      │
│  ✓ Local caching                                         │
└─────────────────────────────────────────────────────────┘
```

### Data Flow Architecture

```
┌──────────┐         ┌──────────┐         ┌────────────┐         ┌─────────┐
│   User   │ ──────▶ │  Widget  │ ──────▶ │   Cubit    │ ──────▶ │  Repo   │
│ Interact │         │   (UI)   │         │  (Logic)   │         │ (Data)  │
└──────────┘         └──────────┘         └────────────┘         └─────────┘
                           ▲                     │                      │
                           │                     ▼                      ▼
                           │              ┌────────────┐         ┌─────────┐
                           │              │   State    │         │Firebase │
                           └────────────  │  Changes   │         │Services │
                                          └────────────┘         └─────────┘
```

---

## 🔥 Key Technical Highlights

### 1. **Atomic Booking Transactions**

Prevents race conditions when multiple users book the last seat using Firestore transactions with ACID guarantees.

### 2. **Prefix-Based Search**

Autocomplete-style search without external services using Firestore array-contains queries with <100ms response times.

### 3. **Real-time Chat**

WebSocket-free real-time messaging using Firestore snapshots with automatic offline support and reconnection handling.

### 4. **Reverse Geocoding**

Interactive map location picker with automatic address conversion from coordinates using the geocoding package.

### 5. **Bidirectional Follow System**

Optimized social graph queries with denormalized follower/following counts and batch writes for data consistency.

---

## 🛠️ Development

### Development Environment Setup

```bash
# Enable all platforms
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
flutter config --enable-web

# Check Flutter doctor
flutter doctor -v

# Analyze code
flutter analyze

# Format code
flutter format lib/
```

### Building for Production

**Android APK:**
```bash
flutter build apk --release --split-per-abi
```

**Android App Bundle (for Play Store):**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
open ios/Runner.xcworkspace  # Open in Xcode for signing
```

**Web:**
```bash
flutter build web --release --web-renderer canvaskit
```

**Windows:**
```bash
flutter build windows --release
```

---

## 📚 API Documentation

### Core Repositories

#### EventsRepo

```dart
abstract class EventsRepo {
  Future<Either<Failure, List<EventModel>>> fetchAllEvents();
  Future<Either<Failure, List<EventModel>>> fetchEventsByCategory({required String category});
  Future<Either<Failure, String>> createEvent({required EventModel event});
  Future<Either<Failure, EventModel>> getEventById(String eventId);
  Future<Either<Failure, List<EventModel>>> fetchMyEvents({required String userId});
  Future<Either<Failure, String>> updateEvent({required EventModel event});
}
```

#### BookingRepo

```dart
abstract class BookingRepo {
  Future<Either<Failure, BookingModel>> bookEvent({
    required String userId,
    required String eventId,
    required int price,
  });
  Future<Either<Failure, void>> cancelBooking({
    required String bookingId,
    required String eventId,
    required String userId,
  });
  Future<Either<Failure, List<BookingModel>>> getUserBookings({required String userId});
  Stream<QuerySnapshot> getUserBookingsStream({required String userId});
}
```

#### MessagingRepo

```dart
abstract class MessagingRepo {
  Future<Either<Failure, MessageModel>> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
    MessageType type = MessageType.text,
  });
  Stream<Either<Failure, List<MessageModel>>> getConversationMessages({
    required String conversationId,
  });
  Future<Either<Failure, void>> markMessagesAsRead({
    required String conversationId,
    required String userId,
  });
}
```

---

## 🧪 Testing

### Unit Tests

```dart
void main() {
  group('HomeCubit', () {
    late MockEventsRepo mockEventsRepo;
    late HomeCubit homeCubit;

    setUp(() {
      mockEventsRepo = MockEventsRepo();
      homeCubit = HomeCubit(mockEventsRepo);
    });

    test('initial state is HomeInitial', () {
      expect(homeCubit.state, isA<HomeInitial>());
    });

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, HomeSuccess] when getAllEvents succeeds',
      build: () {
        when(mockEventsRepo.fetchAllEvents())
            .thenAnswer((_) async => Right([mockEvent]));
        return homeCubit;
      },
      act: (cubit) => cubit.getAllEvents(),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeSuccess>(),
      ],
    );
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 🗺️ Roadmap

### Version 2.0.0 - Enhanced Booking 🎟️
- [ ] Payment gateway integration (Stripe, PayPal)
- [ ] QR code ticket generation
- [ ] Ticket transfer between users
- [ ] Refund management system
- [ ] Early bird discounts and promo codes

### Version 2.1.0 - Advanced Discovery 🔍
- [ ] AI-powered event recommendations
- [ ] Nearby events with geofencing
- [ ] Event history and attendance tracking
- [ ] Trending events algorithm
- [ ] Save search filters

### Version 2.2.0 - Rich Content 🎨
- [ ] Video event previews
- [ ] Live streaming integration
- [ ] Event photo galleries
- [ ] 360° venue tours
- [ ] Rich text event descriptions with markdown

### Version 2.3.0 - Social Features 👥
- [ ] Group bookings
- [ ] Friend invitations
- [ ] Event check-ins with NFC
- [ ] Social feed of attended events
- [ ] User reviews and ratings

### Version 3.0.0 - Enterprise Features 🏢
- [ ] Multi-language support (i18n)
- [ ] Organizer analytics dashboard
- [ ] Bulk event creation
- [ ] API for third-party integrations
- [ ] Admin panel for moderation

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit your changes** (`git commit -m 'feat: add amazing feature'`)
4. **Push to your fork** (`git push origin feature/amazing-feature`)
5. **Open a Pull Request**

### Commit Message Convention

Follow [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes
- `refactor:` Code refactoring
- `test:` Adding tests
- `chore:` Maintenance tasks

---



## 🙏 Acknowledgments

### Framework & Tools
- **[Flutter Team](https://flutter.dev)** - For the revolutionary cross-platform framework
- **[Firebase Team](https://firebase.google.com)** - For the comprehensive backend infrastructure
- **[Google Maps Platform](https://developers.google.com/maps)** - For location services

### Open Source Libraries
- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** - Predictable state management
- **[dartz](https://pub.dev/packages/dartz)** - Functional programming in Dart
- **[get_it](https://pub.dev/packages/get_it)** - Service locator pattern
- **[go_router](https://pub.dev/packages/go_router)** - Declarative routing
- **[geolocator](https://pub.dev/packages/geolocator)** - Location services
- **[cached_network_image](https://pub.dev/packages/cached_network_image)** - Image caching

### Community
- **Flutter Community** - For continuous support and inspiration
- **Stack Overflow** - For troubleshooting assistance
- **GitHub Contributors** - For pull requests and issue reports

---

<div align="center">

### ⭐ Star this repository if you found it helpful! ⭐

**Built with ❤️ using Flutter**

[Report Bug](https://github.com/yourusername/event_booking_app/issues) • [Request Feature](https://github.com/yourusername/event_booking_app/issues)

---

**Made with 💙 by Flutter Developers, for the World**

Copyright © 2025. All rights reserved.

</div>
