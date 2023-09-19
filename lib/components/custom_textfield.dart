import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;

  const CustomTextField({super.key, required this.hintText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: null,
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 163, 172, 188),
                fontWeight: FontWeight.w300),
            border: InputBorder.none,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0)),
      ),
    );
  }
}
