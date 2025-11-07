import 'package:nutri_genie_app/src/domain/entities/user_profile.dart';

abstract class UserRepository {
  Future<UserProfile> createUserProfile(UserProfile profile);
  Future<UserProfile> getUserProfile(String userId);
  Future<UserProfile> updateUserProfile(UserProfile profile);
  Future<void> deleteUserProfile(String userId);
}