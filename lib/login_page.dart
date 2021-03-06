import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/Logo.png')),
              Container(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            // if (email == 'bruno@bruno.com.br' &&
                            //     password == '123') {
                            //   Navigator.of(context)
                            //       .pushReplacementNamed('/home');
                            // } else {
                            //   print('login invalido');
                            // }
                            var url =
                                Uri.parse('http://10.0.2.2:8080/api/v1/login');
                            print(url);
                            var response = await http.post(url, body: {
                              "username": email,
                              "password": password
                            });
                            var json = jsonDecode(response.body);
                            //print(json['token']);
                            if (response.statusCode == 200) {
                              if (json.containsKey('token')) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              }
                            }
                            // if (json['token']){
                            //   print("Aq");
                            // }
                            // if (response.statusCode == 200) {
                            //   Navigator.of(context)
                            //       .pushReplacementNamed('/home');
                            // } else {
                            //   print('login invalido');
                            // }
                            // print('Response status: ${response.statusCode}');
                            // print('Response body: ${response.body}');
                          },
                          child: Container(
                              width: double.infinity,
                              child: Text(
                                'Entrar',
                                textAlign: TextAlign.center,
                              )))
                    ],
                  ),
                ),
              ),
              Container(
                  width: 200,
                  height: 200,
                  child: GestureDetector(
                    child: Text('Ainda n??o possui uma conta? Cadastre-se', style: TextStyle(fontSize: 15, color: Colors.white)),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/register');
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(46, 55, 70, 1),
        body: Stack(
          children: [
            // SizedBox(
            //     height: MediaQuery.of(context).size.height,
            //     child: Image.asset('assets/images/background.jpg',
            //         fit: BoxFit.cover)
            //         ),
            // Container(
            //   color: Colors.black.withOpacity(0.15),
            // ),
            _body(),
          ],
        ));
  }
}
