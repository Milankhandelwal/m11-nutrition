import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutri_genie_app/src/data/models/user_profile_model.dart';

abstract class UserFirestoreDataSource {
  Future<UserProfileModel> createUserProfile(UserProfileModel profile);
  Future<UserProfileModel> getUserProfile(String userId);
  Future<UserProfileModel> updateUserProfile(UserProfileModel profile);
  Future<void> deleteUserProfile(String userId);
}

class UserFirestoreDataSourceImpl implements UserFirestoreDataSource {
  final FirebaseFirestore firestore;

  UserFirestoreDataSourceImpl(this.firestore);

  @override
  Future<UserProfileModel> createUserProfile(UserProfileModel profile) async {
    final userDoc = firestore.collection('users').doc(profile.id);
    await userDoc.set(profile.toJson());
    return profile;
  }

  @override
  Future<UserProfileModel> getUserProfile(String userId) async {
    final userDoc = firestore.collection('users').doc(userId);
    final snapshot = await userDoc.get();
    
    if (snapshot.exists) {
      return UserProfileModel.fromJson(snapshot.data()!);
    } else {
      throw Exception('User profile not found');
    }
  }

  @override
  Future<UserProfileModel> updateUserProfile(UserProfileModel profile) async {
    final userDoc = firestore.collection('users').doc(profile.id);
    await userDoc.update(profile.toJson());
    return profile;
  }

  @override
  Future<void> deleteUserProfile(String userId) async {
    final userDoc = firestore.collection('users').doc(userId);
    await userDoc.delete();
  }
}