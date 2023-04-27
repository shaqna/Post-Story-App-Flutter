import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_story_app/resources/colors.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width - 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocConsumer<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: dark_golden),
                      );
                    } else if (state is LoginSuccess) {}
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(OnUserLogin(
                            _emailController.text, _passwordController.text));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: dark_golden),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: 'aclonica', color: Colors.white),
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state is LoginError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                        duration: const Duration(seconds: 1),
                      ));
                    } else if (state is LoginSuccess) {
                      context.goNamed('home_screen');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
