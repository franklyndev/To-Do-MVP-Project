import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/create_account_model.dart';

class CreateAccountController extends GetxController {
  late TextEditingController nomeController;
  late TextEditingController emailController;
  late TextEditingController senhaController;

  final isLoading = false.obs;
  final isSuccess = false.obs;
  final errorMessage = ''.obs;

  Rx<CreateAccountModel> createAccountModel = Rx<CreateAccountModel>(
    CreateAccountModel(),
  );

  @override
  void onInit() {
    super.onInit();
    nomeController = TextEditingController();
    emailController = TextEditingController();
    senhaController = TextEditingController();
    createAccountModel.value = CreateAccountModel();
  }

  @override
  void onClose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.onClose();
  }

  String? validateNome(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, insira seu nome';
    }
    if (value.trim().length < 2) {
      return 'O nome deve ter pelo menos 2 caracteres';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, insira seu email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Por favor, insira um email válido';
    }
    return null;
  }

  String? validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  void onCreateAccount() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      await Future.delayed(Duration(milliseconds: 800));

      createAccountModel.value.nome?.value = nomeController.text.trim();
      createAccountModel.value.email?.value = emailController.text.trim();

      isSuccess.value = true;

      _clearForm();

      Get.snackbar(
        'Sucesso',
        'Conta criada com sucesso!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: appTheme.blue_gray_800,
        colorText: appTheme.white_A700,
        duration: Duration(seconds: 2),
      );

      await Future.delayed(Duration(seconds: 2));
      Get.offAllNamed(AppRoutes.dailyTasksDashboardScreen);
    } catch (e) {
      errorMessage.value = 'Erro ao criar conta. Tente novamente.';
      Get.snackbar(
        'Erro',
        errorMessage.value,
        snackPosition: SnackPosition.TOP,
        backgroundColor: appTheme.colorFFE539,
        colorText: appTheme.white_A700,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void onNavigateToLogin() {
    Get.offAllNamed(AppRoutes.dailyTasksDashboardScreen);
  }

  void _clearForm() {
    nomeController.clear();
    emailController.clear();
    senhaController.clear();
  }
}
