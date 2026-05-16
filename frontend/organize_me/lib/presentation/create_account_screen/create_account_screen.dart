import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_criar_button.dart';
import '../../widgets/custom_edit_text.dart';
import './controller/create_account_controller.dart';

class CreateAccountScreen extends GetWidget<CreateAccountController> {
  CreateAccountScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 164.h),
              Padding(
                padding: EdgeInsets.only(left: 65.h),
                child: Text(
                  'Criar sua conta',
                  style: TextStyleHelper.instance.display36BoldInter.copyWith(
                    height: 44 / 36,
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.only(left: 29.h),
                child: Text(
                  'Comece a organizar a sua vida hoje',
                  style: TextStyleHelper.instance.title20BoldInter.copyWith(
                    color: appTheme.indigo_300,
                    height: 25 / 20,
                  ),
                ),
              ),
              SizedBox(height: 58.h),
              Container(
                margin: EdgeInsets.only(left: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 28.h),
                decoration: BoxDecoration(
                  color: appTheme.blue_gray_100,
                  borderRadius: BorderRadius.circular(30.h),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNomeField(),
                    SizedBox(height: 6.h),
                    _buildEmailField(),
                    SizedBox(height: 14.h),
                    _buildSenhaField(),
                    SizedBox(height: 44.h),
                    _buildCriarButton(),
                    SizedBox(height: 22.h),
                    _buildLoginLink(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNomeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Text(
            'Nome',
            style: TextStyleHelper.instance.title20BoldInter.copyWith(
              height: 25 / 20,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.only(left: 6.h, right: 2.h),
          child: Obx(
            () => CustomEditText(
              controller: controller.nomeController,
              hintText: '',
              hasBorder: true,
              borderColor: appTheme.blue_100,
              borderRadius: 20,
              backgroundColor: appTheme.blue_50,
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
              keyboardType: TextInputType.text,
              enabled: !(controller.isLoading.value),
              validator: (value) => controller.validateNome(value),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18.h),
            child: Text(
              'Email',
              style: TextStyleHelper.instance.title20BoldInter.copyWith(
                height: 25 / 20,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Obx(
            () => CustomEditText(
              controller: controller.emailController,
              hintText: '',
              hasBorder: false,
              borderRadius: 24,
              backgroundColor: appTheme.blue_50,
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
              keyboardType: TextInputType.emailAddress,
              enabled: !(controller.isLoading.value),
              validator: (value) => controller.validateEmail(value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSenhaField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2.h,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18.h),
            child: Text(
              'Senha',
              style: TextStyleHelper.instance.title20BoldInter.copyWith(
                height: 25 / 20,
              ),
            ),
          ),
          Obx(
            () => CustomEditText(
              controller: controller.senhaController,
              hintText: '',
              hasBorder: false,
              borderRadius: 24,
              backgroundColor: appTheme.blue_50,
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              enabled: !(controller.isLoading.value),
              validator: (value) => controller.validateSenha(value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCriarButton() {
    return Padding(
      padding: EdgeInsets.only(left: 6.h, right: 2.h),
      child: Obx(
        () => CustomCriarButton(
          width: double.infinity,
          text: 'Criar',
          isLoading: controller.isLoading.value,
          onPressed: controller.isLoading.value
              ? null
              : () {
                  if (_formKey.currentState?.validate() ?? false) {
                    controller.onCreateAccount();
                  }
                },
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Center(
      child: GestureDetector(
        onTap: () => controller.onNavigateToLogin(),
        child: Text(
          'Ja possui cadastro? entrar',
          style: TextStyleHelper.instance.title16BoldInter.copyWith(
            height: 20 / 16,
          ),
        ),
      ),
    );
  }
}
