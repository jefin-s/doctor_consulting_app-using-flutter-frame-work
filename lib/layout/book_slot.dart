import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Bookslot extends StatefulWidget {
  const Bookslot({super.key});

  @override
  State<Bookslot> createState() => _BookslotState();
}

class _BookslotState extends State<Bookslot> {
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
    var url = Uri.parse("http://192.168.43.90:800/booking_details/book/");
    Response resp = await post(url, body: {
      'booking_date': date.text.toString(),
      'booking_time': time.text.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
