import 'dart:async';

import 'package:bloc_login/credential_validators.dart';
import 'package:common/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloC with CredentialValidators implements BloCBase {
  final BehaviorSubject<String> _username = BehaviorSubject<String>();
  StreamSink<String> get _inUsername => _username.sink;
  Observable<String> get outUsername => _username.stream.transform(usernameValidator);
  Function(String) get updateUsername => _inUsername.add;
  
  final BehaviorSubject<String> _password = BehaviorSubject<String>();
  StreamSink<String> get _inPassword => _password.sink;
  Observable<String> get outPassword => _password.stream.transform(passwordValidator);
  Function(String) get updatePassword => _inPassword.add;

  Observable<bool> get isValid => Observable.combineLatest2<String, String, bool>(outUsername, outPassword, (username, password) => true);

  void submit() {
    print('Submit username and password: ${_username.value} / ${_password.value}');
  }
  
  @override
  void dispose() {
    _username.close();
    _password.close();
  }
}