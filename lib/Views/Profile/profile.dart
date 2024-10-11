import 'package:designpattern/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:designpattern/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:designpattern/DesignSystem/shared/styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  int actualIndex = 3;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Title(
                  color: Colors.black,
                  child: const Text(
                    'Perfil',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.asset(
                    'assets/images/AvatarProfile.png',
                    width: 64,
                    height: 64,
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amanda Doe',
                          style: button1Bold,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                                    IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                    ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 40),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                    children: [
                      Text("Partidas Jogadas", style: TextStyle(fontSize:20)),
                      const SizedBox(height: 8),
                      Text("100", style: TextStyle(fontSize: 46)),
                    ],
                    ),
                    Column(
                    children: [
                      Text("% Vitórias", style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 8),
                      Text("30%", style: TextStyle(fontSize: 46)),
                    ],
                    ),
                  ],
                ),

            ],
          ),
        ),

      ),
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Login",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.label),
              label: "Label",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onIndexChanged: (index) {
            setState(() {
              actualIndex = index;
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }
}
