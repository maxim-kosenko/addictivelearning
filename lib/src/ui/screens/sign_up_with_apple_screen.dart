import 'package:addictivelearning/src/misc/misc.dart';
import 'package:addictivelearning/src/ui/components/page_template.dart';
import 'package:flutter/material.dart';

class SignUpWithAppleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: "Sign up with Apple",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('images/sign_up.png'),
          Text(
            'Sign up',
            style: Theme.of(context).textTheme.headline,
          ),
          Text(
            'Do you want to add the ability to use Sign\nin with Apple for your accounte? You\'ll be\nable to log in with on tap one all your\ndevices.\n\nYour existing email+password will\ncontinue to work.',
            style: Theme.of(context).textTheme.body2,
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            onPressed: () {},
            color: CustomColors.black,
            child: Text('Continue with Apple'),
          )
        ],
      ),
    );
  }
}
