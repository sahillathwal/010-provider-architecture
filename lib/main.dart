import 'package:flutter/material.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/router.dart' as app_router;

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: 'login',
      onGenerateRoute: app_router.Router.generateRoute,
    );
  }
}
