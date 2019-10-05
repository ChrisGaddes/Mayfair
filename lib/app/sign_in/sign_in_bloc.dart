import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mayfair/services/auth.dart';

class SignInBloc {
  SignInBloc({@required this.auth});

  final AuthBase auth;


  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {

    try {
      _setIsLoading(true);
      await signInMethod();
    } catch (e) {
      rethrow;
    } finally {
      _setIsLoading(false);
    }
  }

  Future<User> signInAnonymously() async => _signIn(auth.signInAnonymously);
  Future<User> signInWithGoogle() async => _signIn(auth.signInWithGoogle);
  Future<User> signInWithFacebook() async => _signIn(auth.signInWithFacebook);

}


