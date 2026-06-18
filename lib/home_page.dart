import 'package:flutter/material.dart';
import 'package:flutter_learn/app_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  String savedEmail = 'Carregando...';
  String apiData = 'Buscando dados da API...';

  @override
  void initState() {
    super.initState();
    _loadLocalData();
    _fetchApiData();
  }

  // LER ARMAZENAMENTO LOCAL
  Future<void> _loadLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedEmail = prefs.getString('user_email') ?? 'thiagoabcfc@gmail.com';
    });
  }

  // CONSUMIR API REST
  Future<void> _fetchApiData() async {
    try {
      final response = await http.get(Uri.parse('https://api.adviceslip.com/advice'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          apiData = data['slip']['advice']; // Pega um conselho aleatório da API
        });
      }
    } catch (e) {
      setState(() {
        apiData = 'Falha ao conectar com a API.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 120, 207, 123),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'T',
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
              accountName: const Text('Thiago DevApp'), 
              accountEmail: Text(savedEmail), // Exibe o e-mail que veio do SharedPreferences
            ),
            ListTile(
              title: const Text('Item 1'),
              subtitle: const Text('Subitem 1'),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              subtitle: const Text('Finalizar sessão'),
              leading: const Icon(Icons.logout),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () async {
                // Limpa o cache ao deslogar
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                
                if(context.mounted){
                  Navigator.of(context).pushReplacementNamed('/');
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Thiago DevApp'),
        centerTitle: true,
        actions: [
          CustomSwitch(),
        ],
        backgroundColor: const Color.fromARGB(255, 120, 207, 123),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          children: [
            Center(child: Text('Contador: $counter', style: const TextStyle(fontSize: 30))),
            const SizedBox(height: 30),
            
            // Container para mostrar o resultado da API
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Conselho da API REST:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 10),
                    Text(apiData, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 50),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 50, height: 50, color: Colors.black),
                Container(width: 50, height: 50, color: Colors.black),
                Container(width: 50, height: 50, color: Colors.black),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
              counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme, 
      onChanged: (value) {
        AppController.instance.changeTheme();
      }
    );
  }
}