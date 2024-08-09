import 'package:flutter/material.dart';

import './resultado.dart';
import './questionario.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 8},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 7},
        {'texto': 'Laranja', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 9},
        {'texto': 'Gato', 'pontuacao': 8},
        {'texto': 'Coelho', 'pontuacao': 4},
        {'texto': 'Cavalo', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual sua sobremesa favorita?',
      'resposta': [
        {'texto': 'Pudim', 'pontuacao': 9},
        {'texto': 'Bolo de chocolate', 'pontuacao': 10},
        {'texto': 'Brigadeiro', 'pontuacao': 5},
        {'texto': 'Sorvete', 'pontuacao': 7},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarJogo() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                onReiniciarJogo: _reiniciarJogo,
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
