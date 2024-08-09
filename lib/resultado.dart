import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() onReiniciarJogo;

  const Resultado({
    super.key,
    required this.pontuacao,
    required this.onReiniciarJogo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('Fim de jogo! A sua pontuação foi de $pontuacao'),
        ),
        TextButton(
          onPressed: onReiniciarJogo,
          child: const Text(
            'Reiniciar jogo?',
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }
}
