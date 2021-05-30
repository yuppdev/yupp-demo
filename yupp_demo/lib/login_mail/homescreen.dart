
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
    );
  }
}
