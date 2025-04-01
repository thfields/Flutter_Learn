
import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  int counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 120, 207, 123),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'T',
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
              accountName: Text('Thiago DevApp'), 
              accountEmail: Text('thiagoabcfc@gmail.com')
            ),
            ListTile(
              title: Text('Item 1'),
              subtitle: Text('Subitem 1'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              leading: Icon(Icons.logout),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Thiago DevApp'),
        centerTitle: true,
        actions: [
          CustomSwitch(),
        ],
        backgroundColor: const Color.fromARGB(255, 120, 207, 123),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(child: Text('contador: $counter', style: TextStyle(fontSize: 30))),
            Container(
              height: 50,
            ),
            Container(
              height: 50,
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black
                ),
            ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
            });
          }
}
