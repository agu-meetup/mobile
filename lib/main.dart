import 'package:agu_meetup_mobile/presentations/authentication/view_model/authentication_model_view.dart';
import 'package:agu_meetup_mobile/presentations/bottom_bar/model_view/bottom_bar_model_view.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:agu_meetup_mobile/presentations/detail_participants/model_view/detail_participants_model_view.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_change_view_model.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_code_view_model.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_mail_phone_view_model.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_selection_view_model.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:agu_meetup_mobile/presentations/intro/model_view/intro_model_view.dart';
import 'package:agu_meetup_mobile/presentations/notification/model_view/notification_model_view.dart';
import 'package:agu_meetup_mobile/presentations/profile/model_view/profile_model_view.dart';
import 'package:agu_meetup_mobile/presentations/sign_in/model_view/sign_in_model_view.dart';
import 'package:agu_meetup_mobile/presentations/sign_up/model_view/sign_up_model_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          create: (_) => ForgotPasswordViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ForgotPasswordSelectionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ForgotPasswordMailPhoneViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ForgotPasswordCodeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ForgotPasswordChangeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateEventModelView(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailModelView(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationModelView(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileModelView(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailParticipantsModelView(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
