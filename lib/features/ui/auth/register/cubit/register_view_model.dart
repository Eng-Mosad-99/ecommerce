import 'package:e_commerece_online_c13/domain/use_cases/register_use_case.dart';
import 'package:e_commerece_online_c13/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterViewModel(this.registerUseCase) : super(RegisterInitialState());

  final RegisterUseCase registerUseCase;
  //todo: hold data - handle logic
  TextEditingController fullNameController =
      TextEditingController(text: 'Amir MO');
  TextEditingController phoneController =
      TextEditingController(text: '01012012551');
  TextEditingController mailController =
      TextEditingController(text: 'amir87@route.com');
  TextEditingController passwordController =
      TextEditingController(text: 'admin@147147');
  TextEditingController rePasswordController =
      TextEditingController(text: 'admin@147147');
  var formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
        fullNameController.text,
        mailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );
      either.fold(
        (failure) => emit(RegisterErrorState(failure.errorMessage)),
        (response) =>
            emit(RegisterSuccessState(registerResponseEntity: response)),
      );
    }
  }
}
