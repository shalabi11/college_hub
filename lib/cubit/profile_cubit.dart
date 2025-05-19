import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:college_hub/cubit/profile_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final user = FirebaseAuth.instance.currentUser;
  File? profileImageFile;

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (pickedFile != null) {
        profileImageFile = File(pickedFile.path);
        emit(ProfileImagePicked(profileImageFile!));
      }
    } catch (e) {
      emit(ProfileError('فشل اختيار الصورة'));
    }
  }

  Future<void> uploadProfileImage() async {
    if (profileImageFile == null || user == null) return;
    emit(ProfileUploading());

    try {
      final ref = FirebaseStorage.instance.ref().child(
        'profile_pictures/${user!.uid}.jpg',
      );
      await ref.putFile(profileImageFile!);
      final url = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'profileImage': url,
      });

      await user!.updatePhotoURL(url);

      emit(ProfileUploaded(url));
    } catch (e) {
      log('🔴 خطأ أثناء رفع الصورة: $e');
      emit(ProfileError('فشل رفع الصورة'));
    }
  }

  void loadInitialPhoto() {
    final url = user?.photoURL;
    if (url != null) {
      emit(ProfileUploaded(url));
    }
  }
}
