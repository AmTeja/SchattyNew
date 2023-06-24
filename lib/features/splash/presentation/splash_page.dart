import 'package:flutter/material.dart';
import 'package:schatty/config/global_constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const routeName = 'splash';
  static const routeLocation = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          GlobalConstants.appName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
