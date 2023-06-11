import 'package:flutter/material.dart';

Future<void> customAlertDialog({required BuildContext context, required String title, required String descricao, void Function()? onPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(descricao),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              if(onPressed != null){
                onPressed();
              }
            },
          ),
        ],
      );
    },
  );
}
