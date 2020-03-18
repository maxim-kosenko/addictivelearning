import 'package:addictivelearning/src/bloc/auth_bloc.dart';
import 'package:addictivelearning/src/constant/routes.dart';
import 'package:addictivelearning/src/misc/misc.dart';
import 'package:addictivelearning/src/ui/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            headline: CustomTypography.headline,
            title: CustomTypography.title,
            subhead: CustomTypography.subhead,
            body2: CustomTypography.body2,
            body1: CustomTypography.body1,
            caption: CustomTypography.caption,
            button: CustomTypography.button,
          ),
          primaryTextTheme: TextTheme(
            headline: CustomTypography.headline,
            title: CustomTypography.title,
            subhead: CustomTypography.subhead,
            body2: CustomTypography.body2,
            body1: CustomTypography.body1,
            caption: CustomTypography.caption,
            button: CustomTypography.button,
          ),
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              color: Theme.of(context).scaffoldBackgroundColor,
              iconTheme: IconThemeData(color: CustomColors.secondary)),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: CustomTypography.caption.copyWith(
              color: Color(0xFF5F7087),
            ), //5F708// 7
            contentPadding: const EdgeInsets.only(bottom: 2.0, top: 4.0),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.black,
                width: 0.0,
              ),
            ),
          ),
          dividerTheme: DividerThemeData(
            color: CustomColors.primary,
            space: 0.0,
          ),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            buttonColor: CustomColors.blue,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minWidth: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 42.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
        onGenerateRoute: _onGenerateRoute,
        home: SplashScreen(),
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WELCOME_SCREEN:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case REGISTRATION_SCREEN:
        return CupertinoPageRoute(builder: (_) => RegistrationScreen());
      case SIGN_IN_SCREEN:
        return CupertinoPageRoute(builder: (_) => SignInScreen());
      case SIGN_UP_WITH_APPLE_SCREEN:
        return CupertinoPageRoute(builder: (_) => SignUpWithAppleScreen());
      case RESET_PASSWORD_SCREEN:
        return CupertinoPageRoute(builder: (_) => ResetPasswordScreen());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
    }
  }
}
