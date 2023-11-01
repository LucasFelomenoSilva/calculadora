import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  static const corPadrao = Color.fromRGBO(201, 201, 201, 1);
  static const corOperacao = Color.fromRGBO(0, 0, 0, 1);
  final String texto;
  final bool duplo;
  final Color corBotao;
  final Color corTexto;
  final void Function(String) callback;

  const Botao({
    super.key,
    required this.texto,
    this.duplo = false,
    this.corBotao = corPadrao,
    this.corTexto = Colors.white,
    required this.callback,
  });
  const Botao.operacao({
    super.key,
    required this.texto,
    this.duplo = false,
    required this.callback,
    this.corBotao = corPadrao,
    this.corTexto = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: duplo ? 2 : 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 54, 67, 244),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CupertinoButton(
          color: corBotao,
          onPressed: () => callback(texto),
          child: Text(
            texto,
            style: TextStyle(
              color: corTexto,
              fontSize: 32,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }
}
