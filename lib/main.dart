import 'package:flutter/material.dart';
import 'package:post_story_app/injection.dart';
import 'package:post_story_app/ui/app/post_story_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initBloc();
  initUseCase();
  initRepository();
  initService();

  
  runApp(PostStoryApp());

  
}
