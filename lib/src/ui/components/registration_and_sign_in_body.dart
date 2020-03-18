import 'package:addictivelearning/src/bloc/auth_bloc.dart';
import 'package:addictivelearning/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:addictivelearning/src/constant/routes.dart';
import 'package:addictivelearning/src/misc/misc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationAndSignInBody extends StatefulWidget {
  @override
  _RegistrationAndSignInBodyState createState() =>
      _RegistrationAndSignInBodyState();
}

class _RegistrationAndSignInBodyState extends State<RegistrationAndSignInBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerPassword = TextEditingController();

  final TextEditingController _controllerEmail = TextEditingController();
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
    return BlocListener(
      bloc: _bloc,
      listener: (_, state) {
        if (state is ErrorAuthState) {
          Scaffold.of(_).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _controllerEmail,
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
                  TextFormField(
                    controller: _controllerPassword,
                    decoration: InputDecoration(labelText: 'Password'),
                    style: Theme.of(context).textTheme.body1,
                    obscureText: true,
                    validator: (input) {
                      if (input.length < 8) {
                        return "Пароль должен быть не менее 8 символов";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Confirm password'),
                    style: Theme.of(context).textTheme.body1,
                    obscureText: true,
                    validator: (input) => input != _controllerPassword.text
                        ? "Пароли должны совпадать"
                        : null,
                  ),
                ],
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _bloc.add(RegisterEvent(
                          user: User(
                        email: _controllerEmail.text,
                        password: _controllerPassword.text,
                        passwordConfirmation: _controllerPassword.text,
                      )));
                    }
                  },
                  child: Text('Join now'),
                  disabledColor: Color(0x705A7BEF),
                  disabledTextColor: Color(0x70FFFFFF),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: CustomColors.secondaryVariant,
                    )),
                    Text(
                      '    Or    ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Expanded(
                        child: Divider(
                      color: CustomColors.secondaryVariant,
                    )),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SIGN_UP_WITH_APPLE_SCREEN);
                  },
                  color: CustomColors.black,
                  child: Text('Sign up with Apple'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
