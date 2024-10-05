import 'package:designpattern/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:designpattern/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:designpattern/DesignSystem/Components/InputField/input_text.dart';
import 'package:designpattern/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:designpattern/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:designpattern/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designpattern/Views/Login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  bool _isAgreed = false; // Variável para o Checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/image148.jpg',
                    width: 148,
                    height: 148,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: controller1,
                  placeholder: 'E-mail',
                  password: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Formato de e-mail inválido!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: passwordController1,
                  placeholder: 'Senha',
                  password: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                    Transform.scale(
                    scale: 1.2, // Aumenta o tamanho do checkbox
                    child: Checkbox(
                      value: _isAgreed,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      ),
                      activeColor: Colors.black,
                      onChanged: (bool? value) {
                      setState(() {
                        _isAgreed = value!;
                      });
                      },
                    ),
                    ),
                  Expanded(
                    child: LinkedLabel.instantiate(
                      viewModel: LinkedLabelViewModel(
                        fullText: "I have read and agree Terms & Services",
                        linkedText: "Terms & Services",
                        onLinkTap: () {},
                        ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              //Colocar um valor para o width que ocupe a largura da tela
              width: double.infinity,
              child:
                ActionButton.instantiate(
                  viewModel: ActionButtonViewModel(
                    size: ActionButtonSize.large,
                    style: ActionButtonStyle.primary,
                    text: 'Sign up',
                    onPressed: () {
                      //redirecionar para pagina Login
                      Navigator.push( 
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                ),
            ),
            const SizedBox(height: 70),
            const Text(
              "Already Have An Account?",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.small,
                style: ActionButtonStyle.primary,
                text: 'Login',
                onPressed: () {
                  Navigator.push( 
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}