import 'package:flutter/material.dart';

import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['resposta']
        : [];

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) => Respostas(
            textoBotao: resp['texto'].toString(),
            quandoSelecionado: () =>
                responder(int.parse(resp['pontuacao'].toString()))))
      ],
    );
  }
}
