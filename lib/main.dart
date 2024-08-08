// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'user.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:  Color.fromARGB(255, 27, 66, 114)),
          useMaterial3: true,
        ),
        home: const MyHomePage());
  }
}

bool isSecured = true;

Map<String, user> users = {
  "Layla1@gmail.com": user(email: 'Layla1@gmail.com', pass: '1202')
};

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController PassC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 27, 66, 114),
        title: const Text(
          "Login Page",
          style: TextStyle(
              fontSize: 38, fontFamily:'IndieFlower', color: Color.fromARGB(255, 255, 255, 255)),

        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/login.png',
              width: 350,
              height: 350,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailC,
                    decoration: InputDecoration(
                      label: Text('Enter Email'),
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: PassC,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                      label: Text('Enter password'),
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      //التاكد من ان الايميل والباسوورد اللي دخلهم المستخدم صحيحه
                      user user1 = users[emailC.text]!;
                      user user2 = users[PassC.text]!;
                      if (user1.email == emailC.text &&
                          user2.pass == PassC.text) {
                        // ignore: avoid_print
                        print('Logged');
                      } else {

                        // ignore: avoid_print
                        print('email or password is worng');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:  Color.fromARGB(255, 27, 66, 114),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'login',
                            style: TextStyle(
                              color: Colors.white,
                               fontSize: 25,
                               fontWeight: FontWeight.bold,
                               fontFamily: 'IndieFlower',
                                ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
