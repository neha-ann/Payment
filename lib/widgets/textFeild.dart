import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final void Function(String)? onChanged; // Added onChanged parameter

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.onChanged, // Added onChanged parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 211, 211, 211)),
          // Change border color here
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red), // Change the color here
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
