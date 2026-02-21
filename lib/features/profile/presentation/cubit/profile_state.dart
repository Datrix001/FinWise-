import 'package:finwise2/features/profile/data/model/profile_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileModel model;

  ProfileLoadedState({required this.model});
}

class ProfileFailureState extends ProfileState {
  final String errorMessage;

  ProfileFailureState({required this.errorMessage});
}
