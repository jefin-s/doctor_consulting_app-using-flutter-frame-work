import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController name,
      gender,
      phone_no,
      passeword,
      user_name,
      email;
  @override
  void initState() {
    name = TextEditingController();
    phone_no = TextEditingController();
    passeword = TextEditingController();
    user_name = TextEditingController();
    email = TextEditingController();
    gender = TextEditingController();
    super.initState();
  }

  void postdata() async {
    var url = Uri.parse("http://127.0.0.1:8000/patient/patient_reg_app/");
    Response resp = await post(url, body: {
      'patient_name': name.text.toString(),
      'username': gender.text.toString(),
      'password': phone_no.text.toString(),
      'email': passeword.text.toString(),
      'phone': email.text.toString(),
      'gender': gender.text.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Register',
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        labelText: 'Enter Your name',
                        hintText: 'Enter Your name',
                        prefix: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: gender,
                    decoration: InputDecoration(
                        labelText: 'Gender ',
                        hintText: 'Select yoour gender',
                        prefix: Icon(Icons.password_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: phone_no,
                    decoration: InputDecoration(
                        labelText: 'Enter Your Phone Number',
                        hintText: 'Enter Your phone number',
                        prefix: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: 'Enter Your Email-id',
                        hintText: 'Enter Your email',
                        prefix: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: user_name,
                    decoration: InputDecoration(
                        labelText: 'Enter the Username ',
                        hintText: 'Enter the username',
                        prefix: Icon(Icons.verified_user),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: passeword,
                    decoration: InputDecoration(
                        labelText: 'Enter the Password ',
                        hintText: 'Enter the password',
                        prefix: Icon(Icons.password_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 14, 123, 137)),
                    onPressed: () {
                      postdata();
                    },
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
