import 'package:flutter/material.dart';
import '/model/core_state.dart';
import '/main.dart';

class ColorPage extends StatelessWidget {
  const ColorPage(this.state, {super.key});

  final CoreState state;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Center(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyColorButton(state, Colors.red),
                  MyColorButton(state, Colors.orange),
                  MyColorButton(state, Colors.greenAccent),
                  MyColorButton(state, Colors.indigo),
                ],
              ),
            ),
          ),
        ),
      );
}

class MyColorButton extends StatelessWidget {
  final Color color;
  final CoreState state;

  const MyColorButton(this.state, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color, elevation: 0),
        onPressed: () {
          state.setColor(color);
          Navigator.pop(context);
        },
        child: Container(height: 100),
      ),
    );
  }
}
