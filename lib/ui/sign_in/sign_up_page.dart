import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/home/home_page.dart';
import 'package:twitter_clone/controllers/auth_controller.dart';
import 'package:twitter_clone/ui/sign_in/widget/text_field_input.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();

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
              const SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your e-mail',
                textEditingController: _emailController,
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
              TextFieldInput(
                hintText: 'Enter your Name',
                textEditingController: _nameController,
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldInput(
                hintText: 'Enter your Bio',
                textEditingController: _bioController,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  ref.read(authProvider).createUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                        name: _nameController.text,
                        bio: _bioController.text,
                      );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
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
                    'Enter',
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
