import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Time to change!',
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.left,
            ),
            Text(
              'You are welcome to the personal development course. Complete daily tasks and keep moving forward/ Start your journely now',
              style: Theme.of(context).textTheme.body2,
            ),
            Image.asset("images/home_screen.png"),
            Text(
              'Player,\nthere are some\nchallenges for you',
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Let\'s go!'),
            ),
          ],
        ),
      ),
    ));
  }
}
