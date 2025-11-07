# 🔥 Firebase Setup Guide for M11 Nutrition

## Current Status
- ✅ Firebase CLI installed
- ✅ Logged in as: **milankhandelwal001@gmail.com**
- ✅ Existing Firebase project found: **m11-nutrition**
- ✅ FlutterFire CLI activated

---

## 🚀 Quick Setup (Automated)

### Step 1: Configure Firebase (Currently Running)

The terminal is waiting for your input. Follow these steps:

1. **Select Project:**
   - Use ↓ arrow to highlight: **m11-nutrition (M11 Nutrition)**
   - Press **Enter**

2. **Select Platforms:**
   - Press **Space** on **android** ✓
   - Press **Space** on **ios** ✓
   - Press **Space** on **web** (optional) ✓
   - Press **Enter** to confirm

3. **Wait for Configuration:**
   - FlutterFire will automatically generate files
   - This takes 30-60 seconds

### Step 2: Verify Configuration

After configuration completes, check these files:

```bash
# Check firebase_options.dart was generated
cat lib/firebase_options.dart

# Check Android config file
ls -la android/app/google-services.json

# Check iOS config file (if you selected iOS)
ls -la ios/Runner/GoogleService-Info.plist
```

---

## 📱 Manual Setup (Alternative Method)

If automated setup fails, follow these manual steps:

### 1. Go to Firebase Console

Visit: https://console.firebase.google.com/

### 2. Select Your Project

Click on **m11-nutrition** project

### 3. Add Android App

1. Click ⚙️ (Settings) → Project Settings
2. Scroll to "Your apps"
3. Click **Android** icon
4. Fill in:
   - **Package name:** `com.nutrigenie.nutri_genie_app` (or your actual package name)
   - **App nickname:** M11 Nutrition Android
   - **Debug signing certificate:** (optional for now)
5. Click **Register app**
6. **Download google-services.json**
7. Place it in: `android/app/google-services.json`

### 4. Add iOS App (if needed)

1. In Project Settings, click **iOS** icon
2. Fill in:
   - **Bundle ID:** (from your Xcode project)
   - **App nickname:** M11 Nutrition iOS
3. Click **Register app**
4. **Download GoogleService-Info.plist**
5. Place it in: `ios/Runner/GoogleService-Info.plist`

### 5. Update firebase_options.dart

Replace the placeholder file with actual configuration:

```dart
// lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_ANDROID_API_KEY',
    appId: 'YOUR_ANDROID_APP_ID',
    messagingSenderId: 'YOUR_SENDER_ID',
    projectId: 'm11-nutrition',
    storageBucket: 'm11-nutrition.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: 'YOUR_SENDER_ID',
    projectId: 'm11-nutrition',
    iosBundleId: 'com.nutrigenie.nutriGenieApp',
    storageBucket: 'm11-nutrition.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'YOUR_WEB_API_KEY',
    appId: 'YOUR_WEB_APP_ID',
    messagingSenderId: 'YOUR_SENDER_ID',
    projectId: 'm11-nutrition',
    authDomain: 'm11-nutrition.firebaseapp.com',
    storageBucket: 'm11-nutrition.appspot.com',
  );
}
```

---

## 🔐 Enable Firebase Services

### 1. Enable Firebase Authentication

1. Go to Firebase Console → **Authentication**
2. Click **Get Started**
3. Enable sign-in methods:
   - ✅ **Email/Password** (Required for your app)
   - ✅ **Google** (Optional)
   - ✅ **Apple** (Optional)

### 2. Enable Cloud Firestore

1. Go to Firebase Console → **Firestore Database**
2. Click **Create database**
3. Select **Start in test mode** (for development)
4. Choose a location (e.g., us-central)
5. Click **Enable**

### 3. Enable Firebase Storage

1. Go to Firebase Console → **Storage**
2. Click **Get started**
3. Select **Start in test mode**
4. Click **Done**

### 4. Enable Firebase Analytics (Optional)

1. Go to Firebase Console → **Analytics**
2. Click **Enable**

### 5. Security Rules (Important!)

**Firestore Rules (Development):**
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow authenticated users to read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Allow all authenticated users to read recipes
    match /recipes/{recipeId} {
      allow read: if request.auth != null;
    }
  }
}
```

**Storage Rules (Development):**
```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /users/{userId}/{allPaths=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

---

## 📊 How to View Login Credentials & Data in Firebase

### Method 1: Firebase Console (Web)

#### View User Authentication Data:
1. Go to: https://console.firebase.google.com/
2. Select **m11-nutrition** project
3. Click **Authentication** in left sidebar
4. Click **Users** tab
5. You'll see:
   - ✅ User UID
   - ✅ Email addresses
   - ✅ Creation date
   - ✅ Last sign-in time
   - ✅ Sign-in providers used

#### View User Profile Data (Firestore):
1. In Firebase Console, click **Firestore Database**
2. Navigate to collections:
   - `users/` → User profiles, settings
   - `users/{email}/meal_plans/` → Saved meal plans
   - `users/{email}/daily_progress/` → Daily tracking data
3. Click any document to see all fields

#### View User Images (Storage):
1. Click **Storage** in sidebar
2. Browse folders:
   - `users/{userId}/profile_images/`
   - `users/{userId}/meal_images/`

### Method 2: Firebase CLI

```bash
# List all users
firebase auth:export users.json --project m11-nutrition

# View Firestore data
firebase firestore:get users --project m11-nutrition

# List storage files
firebase storage:list --project m11-nutrition
```

### Method 3: In Your App (Admin Features)

Add this code to view current user data:

```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Get current logged-in user
User? currentUser = FirebaseAuth.instance.currentUser;

if (currentUser != null) {
  print('User Email: ${currentUser.email}');
  print('User UID: ${currentUser.uid}');
  print('Email Verified: ${currentUser.emailVerified}');
  
  // Get user profile from Firestore
  DocumentSnapshot userDoc = await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.email)
      .get();
  
  print('User Profile Data: ${userDoc.data()}');
}

// List all meal plans for user
QuerySnapshot mealPlans = await FirebaseFirestore.instance
    .collection('users')
    .doc(currentUser.email)
    .collection('meal_plans')
    .get();

print('Total Meal Plans: ${mealPlans.docs.length}');
```

---

## 🧪 Test Firebase Connection

### Step 1: Run the App

```bash
cd /Users/milankhandelwal/Desktop/Desktop/project
flutter run
```

### Step 2: Register a Test User

1. Open the app
2. Click **Register**
3. Enter:
   - Email: test@example.com
   - Password: test123456
4. Click Register

### Step 3: Check Firebase Console

1. Go to **Authentication → Users**
2. You should see the new user appear immediately!

### Step 4: Check Firestore Data

1. Go to **Firestore Database**
2. Navigate to `users/test@example.com`
3. You should see profile data saved

---

## 🔍 Common Firebase Data Locations

### Authentication Data:
- **Location:** Firebase Console → Authentication → Users
- **Data Includes:**
  - Email addresses
  - User IDs (UID)
  - Sign-in providers
  - Account creation date
  - Last sign-in time

### User Profiles:
- **Collection:** `users/{userEmail}/profile`
- **Fields:**
  - age, gender, height, weight
  - fitness_goal, activity_level
  - diet_type, calorie_goal
  - water_goal, steps_goal

### Meal Plans:
- **Collection:** `users/{userEmail}/meal_plans/{date}`
- **Fields:**
  - plan (JSON object with meals)
  - createdAt (timestamp)
  - saved (boolean)

### Daily Progress:
- **Collection:** `users/{userEmail}/daily_progress/{date}`
- **Fields:**
  - calories, water, steps
  - weight
  - date, updatedAt

---

## 📈 Firebase Analytics Dashboard

View app usage statistics:

1. Go to Firebase Console → **Analytics**
2. See:
   - Active users (daily, weekly, monthly)
   - User engagement
   - Screen views
   - Events (login, meal generation, etc.)
   - User demographics

---

## 🛠️ Useful Firebase Commands

```bash
# Check current Firebase project
firebase projects:list

# Switch to m11-nutrition project
firebase use m11-nutrition

# Deploy Firestore rules
firebase deploy --only firestore:rules

# Deploy Storage rules
firebase deploy --only storage

# View Firebase functions logs
firebase functions:log

# Export all users
firebase auth:export users.json

# Import users
firebase auth:import users.json
```

---

## 🔒 Security Best Practices

### 1. Update Firestore Rules for Production

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && 
                            request.auth.uid == userId;
      
      // User's sub-collections
      match /{subcollection}/{document} {
        allow read, write: if request.auth != null && 
                              request.auth.uid == userId;
      }
    }
  }
}
```

### 2. Enable Email Verification

In your auth_screen.dart, after registration:

```dart
await user.sendEmailVerification();
```

### 3. Add Password Reset

```dart
await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
```

---

## 📞 Support & Troubleshooting

### Issue: "Firebase not initialized"
**Solution:** Ensure `Firebase.initializeApp()` is called in `main()` before `runApp()`

### Issue: "google-services.json not found"
**Solution:** Download from Firebase Console and place in `android/app/`

### Issue: "No users showing in Authentication"
**Solution:** Enable Email/Password provider in Firebase Console

### Issue: "Permission denied" in Firestore
**Solution:** Update Firestore security rules to allow authenticated access

---

## ✅ Checklist

After setup, verify:

- [ ] Firebase project created: **m11-nutrition**
- [ ] `firebase_options.dart` generated with real values
- [ ] `google-services.json` in `android/app/`
- [ ] Authentication enabled (Email/Password)
- [ ] Firestore database created
- [ ] Storage bucket created
- [ ] Security rules configured
- [ ] App successfully registers test user
- [ ] User visible in Firebase Console
- [ ] Profile data saved to Firestore

---

## 🎉 Next Steps

Once Firebase is configured:

1. **Test User Registration:** Register in your app
2. **Check Firebase Console:** See user in Authentication
3. **View Firestore Data:** Check user profile in Database
4. **Test Meal Plan Save:** Generate and save a meal plan
5. **Monitor Analytics:** Watch real-time user activity

---

**Firebase Console URL:** https://console.firebase.google.com/project/m11-nutrition

**Your Firebase Email:** milankhandelwal001@gmail.com

---

**End of Setup Guide**
