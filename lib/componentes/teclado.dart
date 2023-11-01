import 'package:flutter/material.dart';
import 'botao.dart';
import 'linha_botoes.dart';

class Teclado extends StatelessWidget {
  final void Function(String) callback;

  const Teclado(this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color.fromRGBO(48, 48, 48, 1)),
      child: SizedBox(
        height: 500,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 2),
            LinhaBotoes([
              Botao.operacao(texto: 'c', callback: callback),
              Botao.operacao(texto: '^', callback: callback),
              Botao.operacao(texto: '!', callback: callback),
              Botao.operacao(texto: '/', callback: callback),
            ]),
            const SizedBox(height: 2),
            LinhaBotoes([
              Botao(texto: '7', corTexto: Colors.black, callback: callback),
              Botao(texto: '8', corTexto: Colors.black, callback: callback),
              Botao(texto: '9', corTexto: Colors.black, callback: callback),
              Botao.operacao(texto: '*', callback: callback),
            ]),
            const SizedBox(height: 2),
            const SizedBox(height: 2),
            LinhaBotoes([
              Botao(texto: '4', corTexto: Colors.black, callback: callback),
              Botao(texto: '5', corTexto: Colors.black, callback: callback),
              Botao(texto: '6', corTexto: Colors.black, callback: callback),
              Botao.operacao(texto: '-', callback: callback),
            ]),
            const SizedBox(height: 2),
            const SizedBox(height: 2),
            LinhaBotoes([
              Botao(texto: '1', corTexto: Colors.black, callback: callback),
              Botao(texto: '2', corTexto: Colors.black, callback: callback),
              Botao(texto: '3', corTexto: Colors.black, callback: callback),
              Botao(texto: '+', callback: callback),
            ]),
            const SizedBox(height: 2),
            const SizedBox(height: 2),
            LinhaBotoes([
              Botao(texto: '0', corTexto: Colors.black, callback: callback),
              Botao(texto: '00', corTexto: Colors.black, callback: callback),
              Botao(texto: '.', corTexto: Colors.black, callback: callback),
              Botao(texto: '=', callback: callback),
            ]),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
