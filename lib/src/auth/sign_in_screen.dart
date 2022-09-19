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
                vertical: 27
              ),
             decoration: const BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45)
                 )
             ),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:   [
               const CustomTextField(
                  icon: Icons.email,
                  label: 'Email',
                 
                ),
               const CustomTextField(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecret: true,
                ),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                      )
                    ),
                    onPressed:(){}, 
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){}, 
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors.red
                      ),
                    )
                  ),
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