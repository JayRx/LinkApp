import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkapp/components/dialog/selectable_dialog.dart';
import 'package:linkapp/helpers/my_flutter_app_icons.dart';

class DropdownTextField extends StatefulWidget {
  final String hintText;

  const DropdownTextField({super.key, required this.hintText});

  @override
  State<DropdownTextField> createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  final TextEditingController textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  void showDropdown() {
    showDialog(
        context: context,
        builder: (context) => SelectableDialog(
              options: const ["Socials", "Coding", "Other"],
              onOptionSelected: dropdownCallback,
            ));
  }

  dropdownCallback(String text) {
    textFieldController.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 163, 172, 188),
                      fontWeight: FontWeight.w300),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0)),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
              onTap: showDropdown,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 107, 99, 254),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: const Icon(MyFlutterApp.chevron_down)),
            ),
          )
        ]),
      ),
    );
  }
}
