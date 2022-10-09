
import 'package:cpf_validator_app/src/models/cpf_models.dart';
import 'package:flutter/cupertino.dart';

class CpfController with ChangeNotifier{
  var _cpf = CpfModel('');
  String _result = '';

  String get result => _result;

  void setCpf(String value) {
    if (value.length >= 11) {  
      _cpf = CpfModel(value);
    }
  }

  void validateCpf() {
    _result = _cpf.isValid() ? 'CPF válido' : 'CPF inválido';
    notifyListeners();
  }

  void createCpf() {
    _result = _cpf.createCpf();
    notifyListeners();
  }
}