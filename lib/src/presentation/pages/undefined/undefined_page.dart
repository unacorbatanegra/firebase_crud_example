import 'package:flutter/material.dart';

class UndefinedPage extends StatelessWidget {
  const UndefinedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorry'),
      ),
      body: Container(
        child: const Center(
          child: Text('Were sorry this page is acttually under development'),
        ),
      ),
    );
  }
}
