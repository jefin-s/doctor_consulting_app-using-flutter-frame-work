import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Viewnotification extends StatefulWidget {
  const Viewnotification({Key? key}) : super(key: key);

  @override
  State<Viewnotification> createState() => _ViewnotificationState();
}

class _ViewnotificationState extends State<Viewnotification> {
  late List data;
  void List_function() async {
    var url = Uri.parse("http://127.0.0.1:8000//notifications/view_nfn/");
    Response resp1 = await get(url);
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
      // drawer: drawuser(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "View Notification",
            style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
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
                              new Text(
                                "Notification name: " +
                                    " " +
                                    data[index]['notification_name'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(
                                "Date : " +
                                    " " +
                                    data[index]['date'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(
                                "Time: " + " " + data[index]['time'].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(
                                "Doctor name : " +
                                    " " +
                                    data[index]['uname'].toString(),
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
