import 'package:flutter/material.dart';

class AnimatedActionButton extends StatefulWidget {
  final IconData icon;
  final double turns;

  final Function onClick;

  const AnimatedActionButton(
      {super.key,
      required this.icon,
      required this.onClick,
      required this.turns});

  @override
  State<AnimatedActionButton> createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<AnimatedActionButton> {
  void onClickCallback() {
    widget.onClick();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickCallback,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(144, 107, 99, 254)),
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(bottom: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(144, 107, 99, 254)),
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 107, 99, 254),
              ),
              padding: const EdgeInsets.all(8),
              child: AnimatedRotation(
                turns: widget.turns,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          )),
    );
  }
}
