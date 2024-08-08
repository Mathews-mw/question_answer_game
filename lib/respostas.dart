import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String textoBotao;
  final void Function() quandoSelecionado;

  const Respostas({
    super.key,
    required this.textoBotao,
    required this.quandoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: quandoSelecionado,
          child: Text(
            textoBotao,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
