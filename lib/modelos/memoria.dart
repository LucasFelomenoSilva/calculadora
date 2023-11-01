import 'dart:math';

class Memoria {
  static const operacoes = ['%', '/', '*', '-', '+', '=', '^', '!'];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operation = '';
  String _valor = '0';
  bool _limparVisor = false;
  String _ultimoComando = '';

  void tratarDigito(String comando) {
    if (_estaSubstituindoOperacao(comando)) {
      _operation = comando;
      return;
    }
    if (comando == 'c') {
      _limpar();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _adicionarDigito(comando);
    }

    _ultimoComando = comando;
  }

  _estaSubstituindoOperacao(String comando) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(comando) &&
        _ultimoComando != '=' &&
        comando != '=';
  }

  _setOperacao(String novaOperacao) {
    bool ehSinalDeIgual = novaOperacao == '=';
    if (_bufferIndex == 0) {
      if (!ehSinalDeIgual) {
        _operation = novaOperacao;
        _bufferIndex = 1;
        _limparVisor = true;
      }
    } else {
      _buffer[0] = _computa();
      _buffer[1] = 0.0;
      _valor = _buffer[0].toString();
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;

      _operation = ehSinalDeIgual ? '' : novaOperacao;
      _bufferIndex = ehSinalDeIgual ? 0 : 1;
    }

    _limparVisor = true;
  }

  _adicionarDigito(String digito) {
    final ehPonto = digito == '.';
    final limparVisor = (_valor == '0' && !ehPonto) || _limparVisor;

    if (ehPonto && _valor.contains('.') && !limparVisor) {
      return;
    }

    final valorVazio = ehPonto ? '0' : '';
    final valorAtual = limparVisor ? valorVazio : _valor;
    _valor = valorAtual + digito;
    _limparVisor = false;

    _buffer[_bufferIndex] = double.tryParse(_valor) ?? 0;
  }

  _limpar() {
    _valor = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = '';
    _limparVisor = false;
  }

  _computa() {
    double resultado;
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case '*':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        resultado = _buffer[0] + _buffer[1];
        break;
      case '^':
        return pow(_buffer[0], _buffer[1]);
      case '!':
        int val = 1;
        for (int i = 2; i <= _buffer[0]; i++) {
          val *= i;
        }
        return val.toDouble();
      default:
        resultado = _buffer[0];
    }
    return double.parse(resultado.toStringAsFixed(1));
  }

  String get valor {
    return _valor;
  }
}
