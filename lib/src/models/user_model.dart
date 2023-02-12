import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, cpf: $cpf, password: $password, id: $id, token: $token)';
  }
}

//factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //     cpf: map['cpf'],
  //     email: map['email'],
  //     id: map['id'],
  //     name: map['fullname'],
  //     password: map['password'],
  //     phone: map['phone'],
  //     token: map['tokrn'],
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'cpf': cpf,
  //     'email': email,
  //     'id': id,
  //     'fullname': name,
  //     'password': password,
  //     'phone': phone,
  //     'token': token,
  //   };
  // }
