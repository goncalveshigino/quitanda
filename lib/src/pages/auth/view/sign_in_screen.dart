import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';

import 'package:quitanda/src/pages/common_widgets/app_name_widget.dart';
import 'package:quitanda/src/pages_routes/app_pages.dart';

import '../../common_widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  
  final _formKey = GlobalKey<FormState>();

  //Controlador de campos
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Nome do app
                  const AppNameWidget(
                    greenTitleColor: Colors.white,
                    textSize: 40,
                  ),

                  // Categorias
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: Duration.zero,
                        animatedTexts: [
                          FadeAnimatedText('Frutas'),
                          FadeAnimatedText('Verduras'),
                          FadeAnimatedText('Legumes'),
                          FadeAnimatedText('Cereais'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            //Formulario
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 27,
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45))),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      label: 'Email',
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Digite seu email';
                        }

                        if (!email.isEmail) return 'Digite um email valido';

                        return null;
                      },
                    ),

                    CustomTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Digite sua palavra passe';
                        }

                        if (password.length < 7) {
                          return 'Digite uma senha de pelo menos 7 caracteres';
                        }

                        return null;
                      },
                    ),

                    SizedBox(
                      height: 50,
                      child: GetX<AuthController>(
                        builder: (authController) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: authController.isLoadin.value
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();

                                    if (_formKey.currentState!.validate()) {
                                      String email = emailController.text;
                                      String password = passwordController.text;

                                      authController.signIn(
                                          email: email, password: password);
                                    } else {
                                      print('Nao Ok');
                                    }

                                    // Get.offNamed(PagesRoutes.baseRoute);
                                  },
                            child: authController.isLoadin.value
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text(
                                    'Entrar',
                                    style: TextStyle(fontSize: 18),
                                  ),
                          );
                        },
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                                color: CustomColors.customConstrastColor),
                          )),
                    ),

                    //Divisor

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou')),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Botao novo usuario
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        side: const BorderSide(width: 2, color: Colors.green),
                      ),
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Get.toNamed(PagesRoutes.signUpRoute);
                      },
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
