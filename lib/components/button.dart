import 'package:flutter/material.dart';
import 'package:post_story_app/resources/dimens.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const Button({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
        ),
      ),
    );
  }
}
