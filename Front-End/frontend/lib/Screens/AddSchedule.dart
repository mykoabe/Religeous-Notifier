import 'package:flutter/material.dart';

class AddSchedule extends StatelessWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Add Schedule"),
        ),
      ),
    );
  }
}
