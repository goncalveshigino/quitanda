import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;

class ProfileTab extends StatelessWidget {
  const ProfileTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuario'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            initialValue: appData.user.name,
            readOnly: true,
            icon: Icons.email,
            label: 'Email',
          ),
          CustomTextField(
            initialValue: appData.user.name,
            readOnly: true,
            icon: Icons.person,
            label: 'Nome',
          ),
          CustomTextField(
            initialValue: appData.user.phone,
            readOnly: true,
            icon: Icons.phone,
            label: 'Telefone',
          ),
          CustomTextField(
            initialValue: appData.user.cpf,
            readOnly: true,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                side: const BorderSide(color: Colors.green),
              ),
              onPressed: () {},
              child: const Text('Atualizar Senha'),
            ),
          )
        ],
      ),
    );
  }
}
