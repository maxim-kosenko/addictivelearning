import 'package:addictivelearning/src/constant/routes.dart';
import 'package:addictivelearning/src/misc/misc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: PageIndicatorContainer(
              child: PageView(
                children: <Widget>[
                  _PageViewItem(
                      position: 0,
                      title:
                          "Watch courses, take\nquizzes, communicate\nwith a coach."),
                  _PageViewItem(
                      position: 1,
                      title:
                          "Dive deep into the\nlesson, learn anytime\nand anywhere."),
                  _PageViewItem(
                      position: 2,
                      title:
                          "Get start!You are within\none touch of new\nexperience."),
                ],
              ),
              align: IndicatorAlign.bottom,
              length: 3,
              indicatorSpace: 20.0,
              padding: const EdgeInsets.all(20.0),
              indicatorColor: CustomColors.secondaryVariant,
              indicatorSelectorColor: CustomColors.primary,
              shape: IndicatorShape.circle(size: 8),
            ),
          ),
          Expanded(child: _ColumnButtons()),
          _BottomWidget(),
        ],
      ),
    );
  }
}

class _PageViewItem extends StatelessWidget {
  const _PageViewItem({Key key, this.title, this.position}) : super(key: key);
  final int position;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Image.asset('images/welcome_$position.png'),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline,
          ),
        ],
      ),
    );
  }
}

class _ColumnButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text('Sign Up with Facebook'),
          ),
          //  SizedBox(height: 16.0),
          RaisedButton(
            color: CustomColors.red,
            onPressed: () {},
            child: Text('Sign up with email'),
          ),
          //SizedBox(height: 16.0),
          FlatButton(
            textColor: CustomColors.primary,
            child: Text('Join now'),
            onPressed: () {
              Navigator.pushNamed(context, REGISTRATION_SCREEN);
            },
          ),
        ],
      ),
    );
  }
}

class _BottomWidget extends StatefulWidget {
  @override
  __BottomWidgetState createState() => __BottomWidgetState();
}

class __BottomWidgetState extends State<_BottomWidget> {
  bool checkPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(value: checkPolicy, onChanged: (s) {
                setState(() {
                  checkPolicy = !checkPolicy;
                });
              }),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Accept ',
                      style: Theme.of(context).textTheme.caption,
                      children: [
                        TextSpan(
                            text: 'Terms of use',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(
                          text: ' and ',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        TextSpan(
                            text: 'Privace Policy',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ]))
            ],
          ),
          RichText(
              text: TextSpan(
                  text: 'Already have an account?',
                  style: Theme.of(context).textTheme.caption,
                  children: [
                TextSpan(
                    text: ' Sign in',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed(SIGN_IN_SCREEN);
                      }),
              ])),
        ],
      ),
    );
  }
}
