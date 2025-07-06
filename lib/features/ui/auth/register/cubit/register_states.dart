import 'package:e_commerece_online_c13/domain/entities/register_response_entity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterResponseEntity registerResponseEntity;

  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}
