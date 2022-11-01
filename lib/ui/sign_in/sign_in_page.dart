import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/home/home_page.dart';
import 'package:twitter_clone/ui/sign_in/widget/text_field_input.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
              TextFieldInput(
                hintText: 'Enter your Id',
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your e-mail',
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textEditingController: _passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                child: Container(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  width: 250,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.blue,
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
