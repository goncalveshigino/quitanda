


String authErrorsString(String?  code){

  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha invalida';

    case 'Invalid session token':
      return 'token ivalid';

    case 'INVALID_FULLNAME':
       return 'Ocorreu um erro ao cadastrar usuario: Nome Invalido';
    
    case 'INVALID_PHONE':
      return 'Ocorreu um erro ao cadastrar usuario: Telefone Invalido';

    case 'INVALID_CPF':
      return 'Ocorreu um erro ao cadastrar usuario: Cpf Invalido';

    default:
    return 'Um erro indefinido ocorreu';
  }
}