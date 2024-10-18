import 'package:flutter/material.dart';
import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
import 'package:kimu_foods/core/utils/generics/notifier_state.dart';
import 'package:kimu_foods/features/profile/data/repositories/profile_repository.dart';
import 'package:kimu_foods/features/profile/domain/entities/profile.dart';
import 'package:kimu_foods/features/profile/domain/repos/profile_repo.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileRepo profileRepo = ProfileRepository();

  GraphqlBaseResponse<Profile>? _profileResponse;

  GraphqlBaseResponse<Profile>? get profileResponse => _profileResponse;

  NotifierState _state = NotifierState.idle;

  NotifierState get state => _state;

  void setNotifierState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Future<GraphqlBaseResponse<Profile>> getProfile() async {
    setNotifierState(NotifierState.loading);
    _profileResponse = await profileRepo.getProfile();
    setNotifierState(NotifierState.loaded);
    return Future.value(_profileResponse);
  }
}
