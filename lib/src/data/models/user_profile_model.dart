import 'package:nutri_genie_app/src/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.age,
    required super.gender,
    required super.height,
    required super.weight,
    required super.activityLevel,
    required super.dietType,
    required super.fitnessGoal,
    super.profileImageUrl,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      activityLevel: json['activityLevel'] as String,
      dietType: json['dietType'] as String,
      fitnessGoal: json['fitnessGoal'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'activityLevel': activityLevel,
      'dietType': dietType,
      'fitnessGoal': fitnessGoal,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory UserProfileModel.fromEntity(UserProfile entity) {
    return UserProfileModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      age: entity.age,
      gender: entity.gender,
      height: entity.height,
      weight: entity.weight,
      activityLevel: entity.activityLevel,
      dietType: entity.dietType,
      fitnessGoal: entity.fitnessGoal,
      profileImageUrl: entity.profileImageUrl,
    );
  }
}