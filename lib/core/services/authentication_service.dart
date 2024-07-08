import 'dart:async';

import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class AuthenticationService {
  // Inject our Api
  final Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetcheduser = await _api.getUserProfile(userId);
// Check if success
    if (fetcheduser != null) {
      // Dart can promote this local variable to non-nullable.
      userController.add(
          fetcheduser); // Now safe to add because fetcheduser is non-null here.
      return true;
    }
    return false;
  }
}
