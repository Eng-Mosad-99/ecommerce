import 'package:e_commerece_online_c13/domain/entities/register_response_entity.dart';

class RegisterResponseDM extends RegisterResponseEntity {
  RegisterResponseDM({super.message, super.user, super.token});

  RegisterResponseDM.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
}

class UserDM extends UserEntity {

String? role;

  UserDM({super.name, super.email, this.role});

  UserDM.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
