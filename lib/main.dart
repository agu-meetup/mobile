import 'package:agu_meetup_mobile/presentations/authentication/view_model/authentication_model_view.dart';
import 'package:agu_meetup_mobile/presentations/bottom_bar/model_view/bottom_bar_model_view.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_selection_view_model.dart';
import 'package:agu_meetup_mobile/presentations/intro/model_view/intro_model_view.dart';
import 'package:agu_meetup_mobile/presentations/sign_in/model_view/sign_in_model_view.dart';
import 'package:agu_meetup_mobile/presentations/sign_up/model_view/sign_up_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './app.dart';

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
        ChangeNotifierProvider(
          create: (_) => ForgotPasswordSelectionViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
