import 'package:cpf_validator_app/src/models/cpf_models.dart';

void main() {
  var cpf = CpfModel('049.635.997-00');
  print(cpf.isValid());

  cpf = CpfModel('111.111.111-11');
  print(cpf.isValid());

  cpf = CpfModel('222.111.111-11');
  print(cpf.isValid());
}


