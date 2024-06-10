import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String? errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.busy);
    var userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.idle);
      return false;
    }
    var success = await _authenticationService.login(userId);
    setState(ViewState.idle);
    return success;
  }
}
