import 'dart:convert';
import 'package:doctor_consulting_app/layout/Register.dart';
import 'package:doctor_consulting_app/layout/edittt.dart';
import 'package:doctor_consulting_app/layout/mainpage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
  static var url = "http://192.168.1.8:8000/";
  static var uid = "";
}

class _loginState extends State<login> {
  late TextEditingController username, password;
  var data = [];

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  void postdata() async {
    var url = Uri.parse(login.url + "/login/logg/");
    Response resp = await post(url,
        body: {"username": username.text, "password": password.text});

    data = jsonDecode(resp.body);
    print(data);
    if (data.length > 0) {
      login.uid = data[0]['u_id'].toString();
      EditProfile.uuid = login.uid;
      // print(login.uid);
      if (data[0]['type'] == "patient") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext) => mainpage()));
        showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(content: Text("you have successfully logged in")));
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 12, 151, 226),
      //   title: Text(
      //     'Login',
      //     style: TextStyle(
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //       letterSpacing: 1.2,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: Stack(
        // child: Center(
        //   child: SingleChildScrollView(
        //     child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blue.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4), // optional dark overlay
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 25, letterSpacing: 1, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                    child: TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 90),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.login,
                          color: Colors.white), // Optional icon
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 137, 123),
                        elevation: 8,
                        shadowColor: Colors.black54,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        postdata();
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            postdata();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext) => Register()),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              // decoration: TextDecoration.underline,
                              // fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
