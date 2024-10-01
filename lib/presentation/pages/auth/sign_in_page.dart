import 'package:flutter/material.dart';
import 'package:flutter_spotify/data/models/auth/sign_in_user_req.dart';
import 'package:flutter_spotify/domain/usecases/auth/signin.dart';
import 'package:flutter_spotify/presentation/pages/auth/sign_up_page.dart';
import 'package:flutter_spotify/presentation/pages/root/root_page.dart';
import 'package:flutter_spotify/presentation/widgets/app_logo.dart';
import 'package:flutter_spotify/presentation/widgets/basic_app_bar.dart';
import 'package:flutter_spotify/presentation/widgets/basic_app_button.dart';
import 'package:flutter_spotify/service_locator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: AppLogo(),
      ),
      bottomNavigationBar: _showSignUpText(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            const SizedBox(
              height: 40,
            ),
            _buildEmeilNameField(context),
            const SizedBox(
              height: 20,
            ),
            _buildPasswordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                  params: SignInUserReq(
                    email: _email.text.toString(),
                    password: _password.text.toString(),
                  ),
                );
                result.fold(
                  (l) {
                    var snackBar = SnackBar(
                      content: Text(l),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (r) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RootPage(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              title: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmeilNameField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _showSignUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a Member? ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                );
              },
              child: const Text('Register Now')),
        ],
      ),
    );
  }
}
