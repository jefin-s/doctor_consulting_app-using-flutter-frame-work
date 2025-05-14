import 'dart:convert';

import 'package:doctor_consulting_app/layout/Login.dart';
import 'package:doctor_consulting_app/layout/bottomnav.dart';
import 'package:doctor_consulting_app/layout/pateint_raw.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Bookslot extends StatefulWidget {
  const Bookslot({super.key});

  @override
  State<Bookslot> createState() => _BookslotState();
}

class _BookslotState extends State<Bookslot> {
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

  late TextEditingController time, date;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        time.text = "${selectedTime.hour}:${selectedTime.minute}";
        print("hello");
        print(selectedTime);
      });
    } else {
      setState(() {
        time.text = "${selectedTime.hour}:${selectedTime.minute}";
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1850, 0),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date.text = "${selectedDate.toLocal().toString().split(' ')[0]}";
      });
    }
  }

  @override
  void initState() {
    time = TextEditingController();
    date = TextEditingController();
  }

  void postdata() async {
    var url = Uri.parse(login.url + "booking_details/book/");
    Response resp = await post(url, body: {
      'booking_date': date.text.toString(),
      'booking_time': time.text.toString(),
      'did': dropdownvalue,
      'kkk': login.uid
    });
  }

  @override
  Widget build(BuildContext context) {
    viewDoctor_name();
    return Scaffold(
      drawer: patientdraw(),
      bottomNavigationBar: bottomnav_ptn(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 64, 255),
        title: const Text("Book Your Slot"),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    showCursor: true,
                    readOnly: true,
                    controller: date,
                    decoration: InputDecoration(
                        labelText: 'Choose your date',
                        hintText: 'choose your date',
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onTap: () {
                      setState(() {
                        _selectDate(context);
                      });
                    },
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
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    showCursor: true,
                    readOnly: true,
                    controller: time,
                    decoration: InputDecoration(
                        labelText: 'Choose your time',
                        hintText: 'choose your time',
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onTap: () {
                      setState(() {
                        _selectTime(context);
                      });
                    },
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
                          builder: (BuildContext) => Bookslot()));
                    },
                    child: Text("submit"),
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
