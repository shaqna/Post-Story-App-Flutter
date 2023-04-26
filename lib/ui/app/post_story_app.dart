import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_story_app/resources/colors.dart';
import 'package:post_story_app/ui/screens/auth/auth_screen.dart';
import 'package:post_story_app/ui/screens/login/login_screen.dart';
import 'package:post_story_app/ui/screens/register/bloc/register_bloc.dart';
import 'package:post_story_app/ui/screens/register/register_screen.dart';

import 'package:post_story_app/injection.dart' as di;

class PostStoryApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/auth',
          name: 'auth_screen',
          builder: (context, state) => const AuthScreen(),
          routes: [
            GoRoute(
                path: 'login',
                name: 'login_screen',
                builder: (context, state) => LoginScreen()),
            GoRoute(
                path: 'register',
                name: 'register_screen',
                builder: (context, state) => RegisterScreen()),
          ]),
    ],
    initialLocation: '/auth',
    debugLogDiagnostics: true,
  );

  PostStoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<RegisterBloc>(),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
             
            },
          ),
        )
      ],
      child: MaterialApp.router(
        theme: ThemeData(primarySwatch: getMaterialColor(light_golden)),
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
