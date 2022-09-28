import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  //Podemos usar tanto void call back ou function a diferença é que a 1° fala que é uma função void e não retorna nada, já a 2° pode ser qqr tipo de function
  final VoidCallback funcaoSelecionada;
  final String resposta;

  const Resposta(this.funcaoSelecionada, this.resposta, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          onPressed: funcaoSelecionada,
          child: Text(
            resposta,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
