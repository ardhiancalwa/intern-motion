import 'package:flutter/material.dart';

class ButtonAppBar extends StatefulWidget {
  final String buttonName;
  final Widget destination;
  final Color color;
  final Color textColor;

  const ButtonAppBar({
    Key? key,
    required this.buttonName,
    required this.destination,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  State<ButtonAppBar> createState() => _ButtonAllState();
}

class _ButtonAllState extends State<ButtonAppBar> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.destination),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        "${widget.buttonName}", 
        style: TextStyle(color: widget.textColor, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
