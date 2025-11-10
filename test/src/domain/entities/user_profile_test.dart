import 'package:flutter_test/flutter_test.dart';
import 'package:nutri_genie_app/src/domain/entities/user_profile.dart';

void main() {
  group('UserProfile', () {
    late UserProfile userProfile;

    setUp(() {
      userProfile = const UserProfile(
        id: '123',
        name: 'John Doe',
        email: 'john@example.com',
        age: 30,
        gender: 'male',
        height: 180.0,
        weight: 75.0,
        activityLevel: 'moderate',
        dietType: 'nonVeg',
        fitnessGoal: 'muscleGain',
        profileImageUrl: 'https://example.com/profile.jpg',
      );
    });

    test('can be instantiated', () {
      expect(userProfile, isNotNull);
    });

    test('has correct properties', () {
      expect(userProfile.id, '123');
      expect(userProfile.name, 'John Doe');
      expect(userProfile.email, 'john@example.com');
      expect(userProfile.age, 30);
      expect(userProfile.gender, 'male');
      expect(userProfile.height, 180.0);
      expect(userProfile.weight, 75.0);
      expect(userProfile.activityLevel, 'moderate');
      expect(userProfile.dietType, 'nonVeg');
      expect(userProfile.fitnessGoal, 'muscleGain');
      expect(userProfile.profileImageUrl, 'https://example.com/profile.jpg');
    });

    test('supports value equality', () {
      final other = const UserProfile(
        id: '123',
        name: 'John Doe',
        email: 'john@example.com',
        age: 30,
        gender: 'male',
        height: 180.0,
        weight: 75.0,
        activityLevel: 'moderate',
        dietType: 'nonVeg',
        fitnessGoal: 'muscleGain',
        profileImageUrl: 'https://example.com/profile.jpg',
      );

      expect(userProfile, equals(other));
    });

    test('can be copied with copyWith', () {
      final copied = userProfile.copyWith(name: 'Jane Doe');
      
      expect(copied.id, userProfile.id);
      expect(copied.name, 'Jane Doe');
      expect(copied.email, userProfile.email);
      expect(copied.age, userProfile.age);
    });

    test('can be serialized to JSON', () {
      final json = userProfile.toJson();
      
      expect(json['id'], '123');
      expect(json['name'], 'John Doe');
      expect(json['email'], 'john@example.com');
      expect(json['age'], 30);
      expect(json['gender'], 'male');
      expect(json['height'], 180.0);
      expect(json['weight'], 75.0);
      expect(json['activityLevel'], 'moderate');
      expect(json['dietType'], 'nonVeg');
      expect(json['fitnessGoal'], 'muscleGain');
      expect(json['profileImageUrl'], 'https://example.com/profile.jpg');
    });

    test('can be deserialized from JSON', () {
      final json = {
        'id': '123',
        'name': 'John Doe',
        'email': 'john@example.com',
        'age': 30,
        'gender': 'male',
        'height': 180.0,
        'weight': 75.0,
        'activityLevel': 'moderate',
        'dietType': 'nonVeg',
        'fitnessGoal': 'muscleGain',
        'profileImageUrl': 'https://example.com/profile.jpg',
      };

      final fromJson = UserProfile.fromJson(json);
      
      expect(fromJson, equals(userProfile));
    });
  });
}