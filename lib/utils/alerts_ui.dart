import 'package:flutter/material.dart';

void showNormalSnackBar(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1300),
    ),
  );
}

void showErrorSnackBar(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1100),
      backgroundColor: Colors.red,
    ),
  );
}