import 'package:flutter/material.dart';
import 'package:linkapp/components/label_item.dart';
import 'package:linkapp/models/label_model.dart';

class LabelBar extends StatefulWidget {
  final List<LabelModel> labels;
  final Function labelClickedCallback;

  const LabelBar(
      {super.key, required this.labels, required this.labelClickedCallback});

  @override
  State<LabelBar> createState() => _LabelBarState();
}

class _LabelBarState extends State<LabelBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 16.0, bottom: 16.0),
      child: Row(
        children: [
          for (var label in widget.labels)
            LabelItem(
              label: label,
              onClickCallback: widget.labelClickedCallback,
            )
        ],
      ),
    );
  }
}
