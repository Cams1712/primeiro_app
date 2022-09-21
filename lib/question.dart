import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  final String perguntas;

  const Question(this.perguntas, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(perguntas);
  }
}
