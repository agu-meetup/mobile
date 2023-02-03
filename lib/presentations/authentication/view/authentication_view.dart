import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/size_config.dart';
import '../../bottom_bar/view/bottom_bar_view.dart';
import '../../intro/model_view/intro_model_view.dart';
import '../../intro/view/intro_view.dart';
import '../view_model/authentication_model_view.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder<AuthenticationStatus?>(
      stream: context.read<AuthenticationModelView>().authStatus,
      builder: (context, snapshot) {
        AuthenticationStatus? authStatus = snapshot.data;
        if (authStatus == AuthenticationStatus.authenticated) {
          // tab bar..
          return const BottomBarView();
        } else if (authStatus == AuthenticationStatus.unauthenticated) {
          // first page...
          context.read<IntroModelView>().changeIsLoading(false);
        } else {
          // snapshot page...
          context.read<IntroModelView>().changeIsLoading(true);
        }
        return const IntroView();
      },
    );
  }
}
