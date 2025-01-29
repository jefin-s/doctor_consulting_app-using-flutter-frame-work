import 'package:flutter/material.dart';

class Bookslot extends StatefulWidget {
  const Bookslot({super.key});

  @override
  State<Bookslot> createState() => _BookslotState();
}

class _BookslotState extends State<Bookslot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 64, 255),
        title: const Text("Book Your Slot"),
      ),
      body: Container(),
    );
  }
}
