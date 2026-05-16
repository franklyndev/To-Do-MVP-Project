import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [create_account_screen] screen with GetX.
class CreateAccountModel {
  Rx<String>? nome;
  Rx<String>? email;
  Rx<bool>? isFormValid;

  CreateAccountModel({this.nome, this.email, this.isFormValid}) {
    nome = nome ?? Rx('');
    email = email ?? Rx('');
    isFormValid = isFormValid ?? Rx(false);
  }
}
