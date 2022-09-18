import 'package:flutter/material.dart';
import 'package:quitanda/src/auth/components/custom_text_field.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.green,
       body:Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40
              ),
             decoration: const BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45)
                 )
             ),
             child: Column(
              children:  [
                CustomTextField(
                  icon: Icons.email,
                  label: 'Email',
                 
                ),
                CustomTextField(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecret: true,
                )
              
              ],
             ),
            ),
          )
        ]
      ),
    );
  }
}