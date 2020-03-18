import 'package:addictivelearning/src/misc/colors.dart';
import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget body;
  final String title;

  const PageTemplate({
    Key key,
    this.body,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Navigator.of(context).canPop()
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_left),
                      Text(
                        'Back',
                        style: TextStyle(color: CustomColors.secondary),
                      ),
                    ],
                  ),
                )
              : Container(),
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: body,
        ));
  }
}
