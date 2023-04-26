import 'package:flutter/material.dart';
import 'package:post_story_app/resources/dimens.dart';

class EditText extends StatelessWidget {
  final String hint;

  const EditText({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue
          )
        ),
        labelText: hint,
      ),
      style: const TextStyle(fontSize: size_14),
    );
  }
}
