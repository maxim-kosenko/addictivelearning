import 'dart:async';

import 'package:addictivelearning/src/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initUniLinks(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Image.asset(
              'images/splash.png',
              fit: BoxFit.fill,
            ),
          ),
        ));
  }

  Future<Uri> initUniLinks(context) async {
    Uri uri;
    try {
      uri = await getInitialUri();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Timer(Duration(seconds: 2), () {
          if (uri != null) {
            Navigator.pushReplacementNamed(context, HOME_SCREEN);
          } else {
            Navigator.pushReplacementNamed(context, WELCOME_SCREEN);
          }
        });
      });
    } catch (e) {
      print(e);
    }
    return uri;
  }
}
