import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_story_app/resources/colors.dart';
import 'package:post_story_app/resources/font.dart';

import 'bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
          child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width - 100),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder()),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: dark_golden,
                        ),
                      );
                    } else if (state is RegisterError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                        duration: const Duration(seconds: 1),
                      ));
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    } else if (state is RegisterSuccess) {
                      context.go('login');
                    }
                    return ElevatedButton(
                      onPressed: () {
                        context.read<RegisterBloc>().add(
                              OnUserRegister(
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text,
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dark_golden,
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: aclonica_font,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
