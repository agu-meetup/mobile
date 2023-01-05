import 'package:google_fonts/google_fonts.dart';

import './features/authentication/view_model/authentication_model_view.dart';
import './features/authentication/view/authentication_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AuthenticationView(),
    );
  }
}
