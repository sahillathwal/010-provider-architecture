import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
              validationMessage: model.errorMessage,
              controller: controller,
            ),
            model.state == ViewState.busy
                ? const CircularProgressIndicator()
                : TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(controller.text);
                      if (loginSuccess) {
                        controller.clear();
                        Navigator.pushNamed(context, '/');
                      }
                    })
          ],
        ),
      ),
    );
  }
}
