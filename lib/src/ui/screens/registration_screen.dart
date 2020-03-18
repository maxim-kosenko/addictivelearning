import 'package:addictivelearning/src/bloc/auth_bloc.dart';
import 'package:addictivelearning/src/ui/components/page_template.dart';
import 'package:addictivelearning/src/ui/components/registration_and_sign_in_body.dart';
import 'package:addictivelearning/src/ui/components/send_email_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      title: 'Join now',
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is LoadedAuthState) {
              return SendEmailBody(
                title: 'Click the link in the email that we just sent you',
                url: state.user.email,
              );
            }
            return RegistrationAndSignInBody();
          }),
    );
  }
}
