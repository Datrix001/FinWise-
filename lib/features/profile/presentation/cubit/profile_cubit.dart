import 'package:finwise2/features/profile/data/repository/profile_repository.dart';
import 'package:finwise2/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit({required this.repository}) : super(ProfileInitialState());

  Future<void> getUserData() async {
    try {
      final userData = await repository.getUserData();
      emit(ProfileLoadedState(model: userData));
    } catch (e) {
      emit(ProfileFailureState(errorMessage: e.toString()));
    }
  }
}
