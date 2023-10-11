import 'package:flutter/material.dart';

InputDecoration getInputDecoration(String? hint) {
  return InputDecoration(
    border: const UnderlineInputBorder(),
    labelText: hint,
  );
}

const vSpacer20 = SizedBox(height: 20);
const hSpacer = SizedBox(width: 10);
