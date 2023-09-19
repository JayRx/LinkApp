import 'package:flutter/material.dart';
import 'package:linkapp/models/label_model.dart';

class LabelItem extends StatefulWidget {
  final LabelModel label;
  final Function onClickCallback;

  const LabelItem(
      {super.key, required this.label, required this.onClickCallback});

  @override
  State<LabelItem> createState() => _LabelItemState();
}

class _LabelItemState extends State<LabelItem> {
  bool enabled = false;

  void onClick() {
    setState(() {
      enabled = !enabled;
    });

    widget.onClickCallback(widget.label, enabled);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          margin: const EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
              color: enabled
                  ? const Color.fromARGB(255, 107, 99, 254)
                  : Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(100)),
          child: Text(
            widget.label.name,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: enabled
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyMedium?.color),
          )),
    );
  }
}
