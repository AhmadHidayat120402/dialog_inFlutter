import 'package:flutter/material.dart';

class LoadingHendler {
  static showLoading(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CircularProgressIndicator(),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }

  static hideLoading(BuildContext, context) {
    Navigator.pop(context);
  }
}
