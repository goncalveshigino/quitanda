import 'package:get/get.dart';

String? emailValidatores(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email';
  }

  if (!email.isEmail) return 'Digite um email valido';

  return null;
}

String? passwordValidator(password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua palavra passe';
  }

  if (password.length < 7) {
    return 'Digite uma senha de pelo menos 7 caracteres';
  }

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite um nome';
  }

  final names = name.split(' ');

  if (names.length == 1) return 'Digite seu nome completo';

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um numero de telefone';
  }
  if (phone.length < 9 || !phone.isPhoneNumber) return 'Digite um numero valido';

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um cpf';
  }

  if (!cpf.isCpf) return 'Digite um CPF valido';

  return null;
}
