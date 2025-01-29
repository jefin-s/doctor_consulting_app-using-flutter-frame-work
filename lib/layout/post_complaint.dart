import 'package:flutter/material.dart';

class PostComplaint extends StatefulWidget {
  const PostComplaint({super.key});

  @override
  State<PostComplaint> createState() => _PostComplaintState();
}

class _PostComplaintState extends State<PostComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      decoration: InputDecoration(
                          labelText: 'Enter Your Complaint',
                          hintText: 'Enter your complaint',
                          prefix: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Select Doctor Name',
                          hintText: 'Select Doctor Name',
                          prefix: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 14, 123, 137)),
                      onPressed: () {},
                      child: Text("Post"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
