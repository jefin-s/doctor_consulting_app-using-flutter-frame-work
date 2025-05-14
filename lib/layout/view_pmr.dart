import 'package:doctor_consulting_app/layout/Login.dart';
import 'package:doctor_consulting_app/layout/bottomnav.dart';
import 'package:doctor_consulting_app/layout/pateint_raw.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Viewpmr extends StatefulWidget {
  const Viewpmr({Key? key}) : super(key: key);

  @override
  State<Viewpmr> createState() => _ViewpmrState();
}

class _ViewpmrState extends State<Viewpmr> {
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url + "/pmr/ooo/");
    Response resp1 = await post(url, body: {'kk': login.uid});
    // data = jsonDecode(resp1.body);
    this.setState(() {
      data = jsonDecode(resp1.body);
    });
    print(resp1.body);
  }

  @override
  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      drawer: patientdraw(),
      bottomNavigationBar: bottomnav_ptn(),
      // drawer: drawuser(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "View PMR",
          style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/ff.jpg'),
            fit: BoxFit.cover,
          )),
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here
                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
                              // new Text(
                              //   "PMR details: " +
                              //       " " +
                              //       data[index]['pmr_details'].toString(),
                              //   style: Theme.of(context).textTheme.titleMedium,
                              // ),
                              // new SizedBox(height: 6.0),

                              // new Text(
                              //   "Doctor name : " +
                              //       " " +
                              //       data[index]['doctor_id'].toString(),
                              //   style: Theme.of(context).textTheme.titleMedium,
                              // ),
                              // new SizedBox(height: 6.0),

                              new Text(
                                "Patient id" +
                                    " " +
                                    data[index]['patient'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(
                                "Phone : " +
                                    " " +
                                    data[index]['phone'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(
                                "prescrptions : " +
                                    " " +
                                    data[index]['prescription'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              new Text(
                                "Date: " + " " + data[index]['date'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              new Text(
                                "Time : " +
                                    " " +
                                    data[index]['time'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(
                                "Gender : " +
                                    " " +
                                    data[index]['gender'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              new Text(
                                "Age : " + " " + data[index]['age'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              new Text(
                                "address : " +
                                    " " +
                                    data[index]['address'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                              new Text(
                                "category: " +
                                    " " +
                                    data[index]['category'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
