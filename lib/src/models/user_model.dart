class UserModel {
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel(
      {this.name,
      this.email,
      this.phone,
      this.cpf,
      this.password,
      this.id,
      this.token});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'],
      email: map['email'],
      id: map['id'],
      name: map['fullname'],
      password: map['password'],
      phone: map['phone'],
      token: map['tokrn'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
     'cpf': cpf, 
     'email': email,
     'id': id,
     'fullname': name,
     'password': password,
     'phone': phone,
     'token': token,
    };
  }

  @override
  String toString() {
    return 'name: $name | cpf: $cpf';
  }
}
