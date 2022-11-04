import 'package:cpf_validator_app/src/models/cpf_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CpfModel newCpf = CpfModel('');
  var result = newCpf.createCpf();

  group('Teste de CPF - ', () {
    test('Deve validar se o cpf criado é válido', () {
      CpfModel cpf = CpfModel(result);

      expect(cpf.isValid(), isTrue);
    });

    test('Deve retornar cpf sem pontuação inválido', () {
      CpfModel cpf = CpfModel('46357320022');

      expect(cpf.isValid(), isFalse);
    });

    test('Deve retornar cpf com pontuação inválido', () {
      CpfModel cpf = CpfModel('540.386.340-01');

      expect(cpf.isValid(), isFalse);
    });

    test('Deve retornar cpf inválido todos caracteres iguais sem pontuação', () {
      CpfModel cpf = CpfModel('11111111111');

      expect(cpf.isValid(), isFalse);
    });

    test('Deve retornar cpf inválido todos caracteres iguais com pontuação', () {
      CpfModel cpf = CpfModel('111.111.111-11');

      expect(cpf.isValid(), isFalse);
    });

    test('Deve retornar o cpf sem pontuação válido', () {
      CpfModel cpf = CpfModel('46357320021');

      expect(cpf.isValid(), isTrue);
    });

    test('Deve retornar o cpf com pontuação válido', () {
      CpfModel cpf = CpfModel('540.386.340-00');

      expect(cpf.isValid(), isTrue);
    });
  });
}
