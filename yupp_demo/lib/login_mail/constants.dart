import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.0)
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.brown, width: 1.0)
    )
);

// Button
// ---------------------------------------
// TextButton(
// style: flatButtonStyle,
// onPressed: () { },
// child: Text('Looks like a FlatButton'),
// )

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    // backgroundColor: Colors.grey,
    primary: Colors.blue,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.orange[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
);
