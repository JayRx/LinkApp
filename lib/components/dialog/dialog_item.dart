import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkapp/helpers/my_flutter_app_icons.dart';

class DialogItem extends StatefulWidget {
  final String optionText;
  final Color backgroundColor;
  final Function onClick;
  final bool selected;

  const DialogItem(
      {super.key,
      required this.optionText,
      required this.backgroundColor,
      required this.onClick,
      required this.selected});

  @override
  State<DialogItem> createState() => _DialogItemState();
}

class _DialogItemState extends State<DialogItem> {
  void onClick() {
    widget.onClick();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: widget.backgroundColor),
          child: Row(
            children: [
              Expanded(
                child: Text(widget.optionText),
              ),
              if (widget.selected)
                Icon(
                  MyFlutterApp.check,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                )
            ],
          )),
    );
  }
}
