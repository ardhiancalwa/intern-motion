import 'package:flutter/material.dart';

class TextFieldGetX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[350]
            : Colors.grey[800],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none),
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
