import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String _errorMessage;

  ErrorMessageWidget(this._errorMessage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_errorMessage),
    );
  }
}
