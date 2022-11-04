import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/sign_in/widget/text_field_input.dart';

import '../home/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              TextFieldInput(
                hintText: 'Enter your Name',
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your e-mail',
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textEditingController: _passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage(userId: 'U6AVmd9dunXA8wqC86EW',);
                      },
                    ),
                  );
                },
                child: Container(
                  width: 250,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
