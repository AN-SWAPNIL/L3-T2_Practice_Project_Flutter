# Travel BD - Your Ultimate Travel Companion in Bangladesh

![App Logo](path/to/your/app_logo.png)  <!-- Replace with your app's logo -->

## Overview

Travel BD is a comprehensive mobile application designed to help users explore the beauty and diversity of Bangladesh. Whether you're a local looking for a weekend getaway or a tourist planning your first trip, Travel BD provides all the tools you need to discover, plan, and enjoy your journey.

This app is built using Flutter, Firebase, GetX, and Provider, ensuring a smooth and engaging user experience.

## Features

* **Explore Tourist Attractions:**
    * Browse a curated list of popular tourist destinations across Bangladesh.
    * View detailed information about each attraction, including descriptions, photos, location, and opening hours.
    * Save your favorite places to a personalized list.

* **Discover Nearby Places:**
    * Find restaurants, hotels, shops, and other points of interest near your current location or a selected destination.
    * Get directions and contact information for nearby places.

* **Community Page:**
    * Connect with other travelers and locals.
    * Share your travel experiences, tips, and recommendations.
    * Discover hidden gems and off-the-beaten-path destinations.

* **User Authentication:**
    * Secure login and registration system using Firebase Authentication.
    * Personalized user profiles.

* **Favorites:**
    * Save your favorite tourist attractions and nearby places for easy access.
    * Manage your list of favorites.

* **User Profile:**
    * View and edit your profile information.

* **Splash Screen:**
    * A splash screen is displayed when the app is launched.

## Technologies Used

* **Flutter:** For building the cross-platform user interface.
* **Firebase:**
    * Firebase Authentication: For user login and registration.
    * Firebase Core: For integrating Firebase services.
* **GetX:** For state management, routing, and dependency injection.
* **Provider:** For managing the favorites list.
* **Dart:** Programming language.

## Getting Started

### Prerequisites

Before you begin, ensure that you have the following installed:

* Flutter SDK installed on your machine.
* Firebase project set up with the necessary services enabled (Authentication, Firestore, etc.).
* Android Studio or VS Code with Flutter and Dart plugins installed.

### Installation

1. **Clone the repository:**
    ```bash
    git clone [repository URL]
    ```
   Replace `[repository URL]` with the actual URL of your project's repository.

2. **Navigate to the project directory:**
    ```bash
    cd travel_bd
    ```

3. **Install dependencies:**
    ```bash
    flutter pub get
    ```

4. **Configure Firebase:**
    * Download the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files from your Firebase project.
    * Place them in the appropriate directories:
        - `android/app/` for Android
        - `ios/Runner/` for iOS
    * Ensure that you have added the correct package name and bundle ID in your Firebase project.
    * Make sure you have enabled the authentication method in your Firebase project.

5. **Run the app:**
    ```bash
    flutter run
    ```

## Project Structure

The project is organized as follows:

travel_bd/
├── android/                       # Android-specific code
├── ios/                           # iOS-specific code
├── lib/                           # Dart source code
│   ├── main.dart                  # Entry point of the app
│   ├── splash/                    # Splash screen files
│   ├── welcome/                   # Welcome page files
│   ├── login/                     # Login & registration files
│   ├── homepage/                  # Main app pages (e.g., homepage, community, profile)
│   ├── pages/                     # Tourist & nearby places details
│   ├── models/                    # Data models
│   └── firebase_options.dart      # Firebase configuration
├── test/                          # Test files
├── pubspec.yaml                   # Project dependencies
└── README.md                      # Project documentation