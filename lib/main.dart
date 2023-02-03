import 'package:agu_meetup_mobile/features/sign_up/presentation/model_view/sign_up_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './app.dart';
import 'features/authentication/presentation/view_model/authentication_model_view.dart';
import 'features/bottom_bar/presentation/model_view/bottom_bar_model_view.dart';
import 'features/intro/repository/model_view/intro_model_view.dart';
import 'features/sign_in/presentation/model_view/sign_in_model_view.dart';

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
        ChangeNotifierProvider(
          create: (_) => SignInModelView(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomBarModelView(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpModelView(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
