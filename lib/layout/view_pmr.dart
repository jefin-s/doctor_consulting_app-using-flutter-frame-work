import 'package:flutter/material.dart';

class ViewPmr extends StatefulWidget {
  const ViewPmr({super.key});

  @override
  State<ViewPmr> createState() => _ViewPmrState();
}

class _ViewPmrState extends State<ViewPmr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('View PMR'),
      ),
    );
  }
}
