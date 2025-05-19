import 'dart:io';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileUploading extends ProfileState {}

class ProfileUploaded extends ProfileState {
  final String imageUrl;
  ProfileUploaded(this.imageUrl);
}

class ProfileImagePicked extends ProfileState {
  final File imageFile;
  ProfileImagePicked(this.imageFile);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
