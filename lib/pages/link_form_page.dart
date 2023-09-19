import 'package:flutter/material.dart';
import 'package:linkapp/components/custom_textfield.dart';
import 'package:linkapp/components/dropdown_textfield.dart';
import 'package:linkapp/components/dropdown_textfield_with_button.dart';

class LinkFormPage extends StatefulWidget {
  const LinkFormPage({super.key});

  @override
  State<LinkFormPage> createState() => _LinkFormPageState();
}

class _LinkFormPageState extends State<LinkFormPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 128.0),
      child: const SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(hintText: "Name"),
              SizedBox(height: 8),
              CustomTextField(hintText: "Link"),
              SizedBox(height: 8),
              DropdownTextField(hintText: "Category"),
              SizedBox(height: 8),
              DropdownTextFieldWithButton(hintText: "Tag"),
            ]),
      ),
    );
  }
}
