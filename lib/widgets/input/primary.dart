import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {

  final Function onChanged;
  final String labelText;
  final TextEditingController controller;

  PrimaryInput(this.labelText, this.onChanged, {this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        onChanged: (value) => onChanged(value),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
              fontSize: 13.0,
              color: Colors.grey
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            // Не работает borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}