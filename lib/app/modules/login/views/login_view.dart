import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:ifarms_theme/ifarms_theme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      controller: controller.usernameCtl,
                      name: 'Username',
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        // FormBuilderValidators.email(),
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      controller: controller.passwordCtl,
                      obscureText: true,
                      name: 'Password',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                    ),
                    const SizedBox(height: 20),
                    controller.obx(
                      (state) => const SizedBox.shrink(),
                      onError: (error) => Column(
                        children: [
                          Text(
                            error ?? 'Gagal login',
                            style: IFTheme.textStyle.h2Bold.copyWith(
                              color: IFTheme.color.red,
                            ),
                          ),
                          const SizedBox(height: 20),
                          IFTheme.button.baseButton(
                            label: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                          ),
                        ],
                      ),
                      onLoading: const CircularProgressIndicator(),
                      onEmpty: IFTheme.button.baseButton(
                        label: 'Login',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
