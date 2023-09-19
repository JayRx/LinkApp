import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkapp/components/dialog/dialog_item.dart';

class SelectableDialog extends StatefulWidget {
  final List<String> options;
  final Function onOptionSelected;

  const SelectableDialog(
      {super.key, required this.options, required this.onOptionSelected});

  @override
  State<SelectableDialog> createState() => _SelectableDialogState();
}

class _SelectableDialogState extends State<SelectableDialog> {
  int selectedOption = -1;

  void optionClick(index) {
    setState(() {
      selectedOption = index;
    });
  }

  void optionSubmit() {
    if (selectedOption != -1) {
      widget.onOptionSelected(widget.options[selectedOption]);
    } else {
      widget.onOptionSelected("");
    }
  }

  void optionClear() {
    widget.onOptionSelected("");
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              height: 60,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          width: 1))),
              child: const Center(child: Text("Category"))),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 160),
            child: ListView(
              shrinkWrap: true,
              children: List.generate(
                  widget.options.length,
                  (index) => DialogItem(
                        optionText: widget.options[index],
                        backgroundColor: index % 2 == 0
                            ? Colors.transparent
                            : const Color.fromARGB(24, 0, 0, 0),
                        onClick: () => {optionClick(index)},
                        selected: index == selectedOption ? true : false,
                      )),
            ),
          ),
          Container(
            height: 48,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        width: 1))),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () => {optionClear(), Navigator.pop(context)},
                      child:
                          const Text("Dismiss", textAlign: TextAlign.center)),
                ),
                Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  height: 48,
                  width: 1,
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () => {optionSubmit(), Navigator.pop(context)},
                      child: Text("Select",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                          textAlign: TextAlign.center)),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
