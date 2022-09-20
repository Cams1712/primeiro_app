// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

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
    return MyAppState();
  }
}

//Classes não devem ter parametros
//Isso permite que a classe seja usada como um widget
class MyAppState extends State<MyApp> {
  var index = 0;
  var perguntas = ["Qual seu animal favorito?", "Qual sua cor favorita?"];

  //Para uma função que será usada nos widgets temos que colocar como void, sem parametros e DENTRO DA CLASSE QUE ESTÃO OS WIDGETS
  void respostaPergunta() {
    setState(() {
      index < 1 ? index++ : index;
    });
    debugPrint("Escolha feita");
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
        body: Column(children: [
          Text(perguntas[index]),
          ElevatedButton(
            //Botão
            //O que acontece quando aprta o btn
            onPressed: () => debugPrint("Escolheu resposta 1!"),
            child: Text("Resposta 1"), //O que estará escrito no btn
          ),
          ElevatedButton(
            //Como esta null o flutter entende que ele não pode ser precionado, então ele coloca como not editable
            onPressed: () {
              //Colocar a logica que desejar
              //Lembrar que esse tipo de função SÓ pode ser usada 1 vez, pois é uma função anonima
              debugPrint("Escolhei resposta 2!");
            },
            child: Text("Resposta 2"),
          ),
          ElevatedButton(
            onPressed:
                respostaPergunta, //Para passar uma função sem que ela seja executada na hora em que esta sendo criada a tela, temos que passar sem os (), assim dart entende que ele tem que chamar esse nome de função quando alguem clicar no btn
            child: Text("Resposta 3"),
          )
        ]),
      ), //Home faz com que o flutter mostre essa tela em primeiro lugar
    );
    return tela; //Faz o basico setup para os widget que vc criar para que apareca na tela
  }
}
