import 'package:addictivelearning/src/bloc/auth_bloc.dart';
import 'package:addictivelearning/src/ui/components/page_template.dart';
import 'package:addictivelearning/src/ui/components/send_email_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: "Reset password",
      body: BlocBuilder(
          bloc: AuthBloc(),
          builder: (context, state) {
            if (state is LoadedAuthState) {
              return SendEmailBody(
                title:
                    'Click the link in the email that we just\nsent you to reset your password',
                url: state.user.email,
              );
            }
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    style: Theme.of(context).textTheme.body1,
                    validator: (input) {
                      String p =
                          "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                      RegExp regExp = new RegExp(p);
                      if (input.isEmpty) {
                        return "Поле не должно быть пустым";
                      } else if (!regExp.hasMatch(input)) {
                        return "Введите правильный email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24.0),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                    },
                    child: Text('Reset password'),
                    disabledColor: Color(0x705A7BEF),
                    disabledTextColor: Color(0x70FFFFFF),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
