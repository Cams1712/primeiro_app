import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  final String perguntas;

  const Question(this.perguntas, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        perguntas,
        style: const TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
