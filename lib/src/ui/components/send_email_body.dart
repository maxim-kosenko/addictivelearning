import 'package:flutter/material.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:url_launcher/url_launcher.dart';

class SendEmailBody extends StatelessWidget {
  final String title;
  final String url;

  const SendEmailBody({Key key, this.title, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('images/reset_password.png'),
        Text(
          'Email sent',
          style: Theme.of(context).textTheme.headline,
        ),
        SizedBox(height: 16.0),
        Text(
          'Click the link in the email that we just\nsent you to reset your password',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.body2,
        ),
        SizedBox(height: 60.0),
        RaisedButton(
          onPressed: launchURL,
          child: Text('Open mail app'),
        ),
      ],
    );
  }

  launchURL() async {
    try {
      await AppAvailability.launchApp("ru.mail.mailapp");
    } catch (e) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
