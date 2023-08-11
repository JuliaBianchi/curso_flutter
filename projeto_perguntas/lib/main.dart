import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Rosa', 'pontuacao': 4},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Pato', 'pontuacao': 5},
        {'texto': 'Pinguim', 'pontuacao': 4},
        {'texto': 'Giraffa', 'pontuacao': 5},
        {'texto': 'Lontra', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuacao': 1},
        {'texto': 'Maria', 'pontuacao': 7},
        {'texto': 'João', 'pontuacao': 4},
        {'texto': 'Alice', 'pontuacao': 5},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
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
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ),);
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
