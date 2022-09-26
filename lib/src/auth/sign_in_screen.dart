import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/auth/components/custom_text_field.dart';
import 'package:quitanda/src/auth/sign_up_screen.dart';
import 'package:quitanda/src/base/base_screen.dart';
import 'package:quitanda/src/config/custom_colors.dart';


class SignInScreen extends StatelessWidget {
  
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    final size = MediaQuery.of(context).size;

    return Scaffold(
       backgroundColor: CustomColors.customSwatchColor,
       body:SingleChildScrollView(
         child: SizedBox(
          height: size.height,
           child: Column(
            children: [
              Expanded(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
       
                    //Nome do app
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Green',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          TextSpan(
                            text: 'grocer',
                            style: TextStyle(
                              color: CustomColors.customConstrastColor,
                            ),
                          ),
                        ]
                      ),
                    ),
       
                  // Categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25
                        ),
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
                      onPressed:(){

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (c){
                            return  const BaseScreen();
                          },),
                        );

                      }, 
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
                      child:  Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          color: CustomColors.customConstrastColor
                        ),
                      )
                    ),
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
                       const  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child:  Text('Ou')
                          ),
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
                    borderRadius: BorderRadius.circular(18)
                  ),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.green
                  )
                ), 
                child: const Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 18
                  ),
                  ),
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (c) {
                        return SignScreen();
                      }
                    )
                  );
                },
              )
       
                 
                
                ],
               ),
              )
            ]
               ),
         ),
       ),
    );
  }
}