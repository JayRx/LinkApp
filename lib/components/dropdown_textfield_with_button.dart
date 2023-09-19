import 'package:flutter/material.dart';
import 'package:linkapp/components/dropdown_textfield.dart';
import 'package:linkapp/helpers/my_flutter_app_icons.dart';

class DropdownTextFieldWithButton extends StatefulWidget {
  final String hintText;

  const DropdownTextFieldWithButton({super.key, required this.hintText});

  @override
  State<DropdownTextFieldWithButton> createState() =>
      _DropdownTextFieldWithButtonState();
}

class _DropdownTextFieldWithButtonState
    extends State<DropdownTextFieldWithButton> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const Expanded(child: DropdownTextField(hintText: "Tag")),
          const SizedBox(width: 8),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 107, 99, 254),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(MyFlutterApp.check)),
          )
        ],
      ),
    );
  }
}
