import 'package:addictivelearning/src/ui/components/page_template.dart';
import 'package:addictivelearning/src/ui/components/registration_and_sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Sign In',
      body: RegistrationAndSignInBody(),
    );
  }
}
