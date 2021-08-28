import 'package:flutter/material.dart';

class HolyPlace extends StatelessWidget {
  const HolyPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Holy Place Page"),
        ),
      ),
    );
  }
}
