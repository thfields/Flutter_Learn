import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_learn/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body(){
    return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 12, right: 12),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 218, 221, 218),
                          ),
                          onPressed: () async {
                            // ARMAZENAMENTO LOCAL
                            final prefs = await SharedPreferences.getInstance();
                            // Salva o email digitado
                            await prefs.setString('user_email', email.isEmpty ? 'visitante@teste.com' : email);

                            if(context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/background.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          _body(),
        ],
      ));
  }
}