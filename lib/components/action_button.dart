import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final IconData icon;
  final Function? onClick;
  final bool visible;

  const ActionButton(
      {super.key, required this.icon, this.onClick, required this.visible});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick?.call(),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromARGB(widget.visible ? 144 : 0, 107, 99, 254)),
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(bottom: 8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(widget.visible ? 144 : 0, 107, 99, 254)),
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 107, 99, 254),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 24,
              ),
            ),
          )),
    );
  }
}
