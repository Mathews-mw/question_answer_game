import 'package:flutter/material.dart';

import './questao.dart';
import './respostas.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': ['Preto', 'Branco', 'Azul', 'Laranja']
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'resposta': ['Cachorro', 'Gato', 'Coelho', 'Cavalo']
    },
    {
      'texto': 'Qual sua sobremesa favorita?',
      'resposta': ['Pudim', 'Bolo de chocolate', 'Brigadeiro', 'Sorvete']
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['resposta']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(
                      texto:
                          _perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((texto) => Respostas(
                      textoBotao: texto, quandoSelecionado: _responder))
                ],
              )
            : const Center(
                child: Text('Fim de jogo!'),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
