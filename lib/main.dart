// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

//Imports que vem das minhas files
import 'package:primeiro_app/question.dart';
import 'package:primeiro_app/respostas.dart';

/*void main() {
//É boa pratica usar const para chamar construtores que são const
  const myApp = MyApp();
  runApp(myApp);
}*/

//Podemos fazer o main dessa forma tbm
void main() => runApp(MyApp());

//Essa classe tem um metodo que é o SetState, devemos colocar dentro disso o que está fazendo com q o texto mude
class MyApp extends StatefulWidget {
  //Criar esse overide para que o flutter saiba que tem que se conectar com o MyAppState e mudar algo
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//Classes não devem ter parametros
//Isso permite que a classe seja usada como um widget
class _MyAppState extends State<MyApp> {
  var _index = 0; //Esse _ faz com que eles fiquem privados, não publicos
  var perguntas = [
    {
      "pergunta": "Qual seu animal favorito?",
      "respostas": [
        "Cachorro",
        "Gato",
        "Passarinho",
        "Girafa",
        "Cavalo",
        "Urso",
      ]
    },
    {
      "pergunta": "Qual sua cor favorita?",
      "respostas": [
        "Branco",
        "Preto",
        "Rosa",
        "Laranja",
        "Amarelo",
      ]
    }
  ];

  //Para uma função que será usada nos widgets temos que colocar como void, sem parametros e DENTRO DA CLASSE QUE ESTÃO OS WIDGETS
  void _respostaPergunta() {
    setState(() {
      _index < 1 ? _index++ : _index--;
    });
  }

//Construtor
//Precisa disso pois é boa pratica colocar um construtor que não va mudar como const, ainda mais se as "chaves" são finals
  MyApp() {
    throw UnimplementedError();
  }

//Esse buildContext faz com que o app pegue info sobre o nosso app
//Esse método sera chamado toda vez que o flutter for construir algo na tela
  @override
  Widget build(BuildContext context) {
    var tela = MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meu primeiro App"),
          backgroundColor: Colors.black,
        ),
        //O body so pode ter um elemento, por isso temos que colocar algo dentro dele que permite colocar mais de um elemento
        body: Column(
          children: [
            Question(perguntas[_index]["pergunta"] as String),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  ...(perguntas[_index]["respostas"] as List<String>)
                      .map((respostas) {
                    return Resposta(
                      _respostaPergunta,
                      respostas,
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ), //Home faz com que o flutter mostre essa tela em primeiro lugar
    );
    return tela; //Faz o basico setup para os widget que vc criar para que apareca na tela
  }
}
