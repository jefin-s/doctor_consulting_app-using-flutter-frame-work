import 'package:doctor_consulting_app/layout/Register.dart';
import 'package:doctor_consulting_app/layout/bottomnav.dart';
import 'package:doctor_consulting_app/layout/login.dart';
import 'package:doctor_consulting_app/layout/pateint_raw.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
  static var k = "";
  static var uuid = "";
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController name, gender, phone, password, username, email;
  late List data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    gender = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    print(EditProfile.uuid);
    fetchUserData();
  }

  void fetchUserData() async {
    print(login.uid.toString());
    var url = Uri.parse(login.url + "patient/sss/");
    Response resp1 = await post(url, body: {"k": EditProfile.uuid});

    if (resp1.statusCode == 200) {
      data = jsonDecode(resp1.body);
      print(data);
      setState(() {
        name.text = data[0]["patient_name"].toString();
        gender.text = data[0]["gender"].toString();
        phone.text = data[0]["phone"].toString();
        email.text = data[0]["email"].toString();
        username.text = data[0]["username"].toString();
        password.text = data[0]["password"].toString();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: ${resp1.statusCode}');
    }
  }

  void postData() async {
    var url = Uri.parse(login.url + "patient/update/");
    Response resp = await post(url, body: {
      "k": EditProfile.uuid,
      "name": name.text,
      "gender": gender.text,
      "phone": phone.text,
      "email": email.text,
      "username": username.text,
      "password": password.text,
    });

    if (resp.statusCode == 200) {
      print('Profile updated successfully');
      Navigator.of(context).pop();
    } else {
      print('Failed to update profile: ${resp.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: patientdraw(),
      bottomNavigationBar: bottomnav_ptn(),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      if (isLoading)
                        CircularProgressIndicator() // Show loading indicator while fetching data
                      else ...[
                        // Name input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              labelText: "Name",
                              prefixIcon: Icon(Icons.people),
                            ),
                          ),
                        ),
                        // Phone number input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                              labelText: "username",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        // Address input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              labelText: "password",
                              prefixIcon: Icon(Icons.location_on),
                            ),
                          ),
                        ),
                        // Email input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: gender,
                            decoration: InputDecoration(
                              labelText: "gender",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: phone,
                            decoration: InputDecoration(
                              labelText: "Phone",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                          child: ElevatedButton(
                            onPressed: () {
                              postData();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext) => EditProfile()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Background color
                            ),
                            child: Text("Update"),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
