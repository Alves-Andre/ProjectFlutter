import 'package:designpattern/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:designpattern/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:designpattern/DesignSystem/Components/InputField/input_text.dart';
import 'package:designpattern/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:designpattern/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:designpattern/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:designpattern/Views/Profile/profile.dart';
import 'package:designpattern/Views/Register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();

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
              const SizedBox(height: 70),
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
              const SizedBox(height: 24),
                Align(
                alignment: Alignment.centerRight,
                child: LinkedLabel.instantiate(
                  viewModel: LinkedLabelViewModel(
                  fullText: "Forgot password",
                  linkedText: "Forgot password",
                  onLinkTap: () {},
                  ),
                ),
                ),
              const SizedBox(height: 16),
              SizedBox(
                //Colocar um valor para o width que ocupe a largura da tela
                width: double.infinity,
                child: ActionButton.instantiate(
                  viewModel: ActionButtonViewModel(
                    size: ActionButtonSize.large,
                    style: ActionButtonStyle.primary,
                    text: 'Login',
                    onPressed: () {
                      // Navegar para a tela de home
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 90),
              const Text(
                "Don't Have An Account?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.small,
                  style: ActionButtonStyle.primary,
                  text: 'Sing Up',
                  onPressed: () {
                    // Navegar para a tela de cadastro
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
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
