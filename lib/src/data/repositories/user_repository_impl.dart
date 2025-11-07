import 'package:nutri_genie_app/src/data/datasources/user_firestore_datasource.dart';
import 'package:nutri_genie_app/src/data/models/user_profile_model.dart';
import 'package:nutri_genie_app/src/domain/entities/user_profile.dart';
import 'package:nutri_genie_app/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFirestoreDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<UserProfile> createUserProfile(UserProfile profile) async {
    final profileModel = UserProfileModel.fromEntity(profile);
    final createdProfile = await dataSource.createUserProfile(profileModel);
    return createdProfile;
  }

  @override
  Future<UserProfile> getUserProfile(String userId) async {
    final profile = await dataSource.getUserProfile(userId);
    return profile;
  }

  @override
  Future<UserProfile> updateUserProfile(UserProfile profile) async {
    final profileModel = UserProfileModel.fromEntity(profile);
    final updatedProfile = await dataSource.updateUserProfile(profileModel);
    return updatedProfile;
  }

  @override
  Future<void> deleteUserProfile(String userId) async {
    await dataSource.deleteUserProfile(userId);
  }
}