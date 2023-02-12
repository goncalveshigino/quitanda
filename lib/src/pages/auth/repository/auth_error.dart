


String authErrorsString(String?  code){

  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha invalida';

      case 'Invalid session token':
      return 'token ivalid';

    default:
    return 'Um erro indefinido ocorreu';
  }
}