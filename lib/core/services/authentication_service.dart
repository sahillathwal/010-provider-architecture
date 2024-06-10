import 'dart:async';

import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class AuthenticationService {
  // Inject our Api
  final Api _api = locator<Api>();
  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetcheduser = await _api.getUserProfile(userId);
// Check if success
    var hasUser = fetcheduser != null;
    return hasUser;
  }
}
