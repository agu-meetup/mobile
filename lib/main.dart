import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './features/authentication/view_model/authentication_model_view.dart';
import './app.dart';
import 'features/intro/model_view/intro_model_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationModelView(),
        ),
        ChangeNotifierProvider(
          create: (_) => IntroModelView(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
