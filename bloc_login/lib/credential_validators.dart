import 'dart:async';

class CredentialValidators {
  final StreamTransformer<String, String> usernameValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
        username.length > 3 ? sink.add(username) : sink.addError('Usernames need at least 4 characters');
      }
  );

  final StreamTransformer<String, String> passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        password.contains('_') ? sink.add(password) : sink.addError('Passwords must contain an underscore');
      }
  );
}