import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:post_story_app/resources/colors.dart';
import 'package:post_story_app/resources/dimens.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Story App'),
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
                left: range_16, right: range_16, top: range_32),
            child: Column(
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'aclonica',
                  ),
                ),
                Image.asset('assets/images/animal.png'),
                const SizedBox(
                  height: 8,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.goNamed('login_screen');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: dark_golden),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: 'aclonica', color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          context.goNamed('register_screen');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontFamily: 'aclonica', color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
