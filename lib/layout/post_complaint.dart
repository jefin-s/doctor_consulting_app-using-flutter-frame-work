import 'dart:convert';
import 'dart:ui_web';
import 'package:doctor_consulting_app/layout/Login.dart';
import 'package:doctor_consulting_app/layout/bottomnav.dart';
import 'package:doctor_consulting_app/layout/pateint_raw.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostComplaint extends StatefulWidget {
  const PostComplaint({super.key});

  @override
  State<PostComplaint> createState() => _PostComplaintState();
}

class _PostComplaintState extends State<PostComplaint> {
  List dropList = [
    {"doctor_id": 0, " doctor_name ": "<Select>"},
  ];
  var fkey = GlobalKey<FormState>();
  var val = true;
  var dropdownvalue = "";

  void viewDoctor_name() async {
    var url = Uri.parse(login.url + "doctor/view_doc/");
    var resp = await get(url);
    print(resp.body);
    setState(() {
      dropList = jsonDecode(resp.body);
    });
  }

  late TextEditingController complaint;
  @override
  void initState() {
    complaint = TextEditingController();
  }

  void postdata() async {
    var url = Uri.parse(login.url + "complaint/post_complaint_app/");
    Response resp = await post(url, body: {
      'complaints': complaint.text.toString(),
      'did': dropdownvalue,
      'ok': login.uid
    });
  }

  Widget build(BuildContext context) {
    viewDoctor_name();
    return Scaffold(
      drawer: patientdraw(),
      bottomNavigationBar: bottomnav_ptn(),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Post your Complaint'),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: complaint,
                    decoration: InputDecoration(
                        labelText: 'Enter Your Complaint',
                        hintText: 'Enter your complaint',
                        prefix: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonFormField(
                    hint: Text("<--Select the Doctor-->"),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownvalue = newValue.toString();
                        print(dropdownvalue);
                      });
                    },
                    items: dropList
                        .map((item) => DropdownMenuItem(
                              child: Text(item['doctor_name'].toString()),
                              value: item['doctor_id'].toString(),
                            ))
                        .toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 14, 123, 137)),
                    onPressed: () {
                      postdata();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext) => PostComplaint()));
                    },
                    child: Text("Post"),
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
