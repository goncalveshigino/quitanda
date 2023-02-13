import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/services/validatores.dart';

class SignUpScreen extends StatelessWidget {

   SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

    final phoneFormatter = MaskTextInputFormatter(
    mask: '+ ### ###-###-###',
    filter: {'#': RegExp(r'[0-9]')},
  );


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [

              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text('Cadastro', style: TextStyle(color: Colors.white, fontSize: 35)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            icon: Icons.email,
                            label: 'email',
                            textInputType: TextInputType.emailAddress,
                            validator: emailValidatores,
                          ),
                          const CustomTextField(
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                            validator: passwordValidator,
                          ),
                          const CustomTextField(
                            icon: Icons.person,
                            label: 'Nome',
                            validator: nameValidator,
                          ),
                           CustomTextField(
                            icon: Icons.phone,
                            label: 'Telefone',
                            inputFormatter: [phoneFormatter],
                            textInputType: TextInputType.phone,
                            validator: phoneValidator,
                          ),
                           CustomTextField(
                            icon: Icons.file_copy,
                            label: 'CPF',
                            inputFormatter: [cpfFormatter],
                            textInputType: TextInputType.number,
                            validator: cpfValidator,
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                              onPressed: () {

                                _formKey.currentState?.validate();

                              },
                              child: const Text(
                                'Cadastrar usuário',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
