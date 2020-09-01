import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_dating/lit_firebase_auth/presentation/widgets/sign_in_buttons.dart';
import 'package:snack_dating/lit_firebase_auth/presentation/widgets/sign_in_text_fields.dart';

import 'core/auth_config.dart';
import 'widgets/sign_in_form.dart';

class StandardSignInWidget extends StatelessWidget {
  const StandardSignInWidget({
    Key key,
    this.config,
  }) : super(key: key);

  static const maxWidth = 500.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Column(
          children: [
            _title(context),
            const SizedBox(height: 16),
            EmailTextFormField(
              decoration: config?.emailTextFormField,
            ),
            const SizedBox(height: 8),
            PasswordTextFormField(
              decoration: config?.passwordTextFormField,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmailAndPasswordSignInButton(
                    config: config?.signInButton,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmailAndPasswordRegisterButton(
                    config: config?.registerButton,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'or',
              style: Theme.of(context).textTheme.overline,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SignInAnonymouslyButton(config: config?.anonymousButton),
            ),
            if (Platform.isAndroid)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: config?.googleButton?.map(
                      (c) => SignInWithGoogleButton(
                        config: c?.config,
                      ),
                      dark: (c) => SignInWithGoogleButton.dark(label: c?.label),
                      light: (c) =>
                          SignInWithGoogleButton.light(label: c?.label),
                    ) ??
                    SignInWithGoogleButton.dark(),
              ),
          ],
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      'Sign in / Register',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
