import 'package:flutter/material.dart';

import '../../../../core/network/entities/graphql_base_response.dart';
import '../../../../core/utils/generics/notifier_state.dart';
import '../../data/repositories/auth_repository.dart';
import '../entities/auth.dart';
import '../repos/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  AuthRepo authRepo = AuthRepository();

  GraphqlBaseResponse<Auth>? _authResponse;

  GraphqlBaseResponse<Auth>? get authResponse => _authResponse;

  GraphqlBaseResponse<String>? _phoneVerificationResponse;

  GraphqlBaseResponse<String>? get phoneVerificationResponse =>
      _phoneVerificationResponse;

  NotifierState _state = NotifierState.idle;

  NotifierState get state => _state;

  void setNotifierState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Future<GraphqlBaseResponse<Auth>> signInWithGoogle(String idToken) async {
    setNotifierState(NotifierState.loading);
    _authResponse = await authRepo.signInWithGoogle(idToken);
    setNotifierState(NotifierState.loaded);
    return Future.value(_authResponse);
  }

  Future<GraphqlBaseResponse<String>> verifyPhoneNumber({
    required String userId,
    required String phoneNumber,
  }) async {
    setNotifierState(NotifierState.loading);
    _phoneVerificationResponse =
        await authRepo.verifyPhoneNumber(userId, phoneNumber);
    setNotifierState(NotifierState.loaded);
    return Future.value(_phoneVerificationResponse);
  }
}
