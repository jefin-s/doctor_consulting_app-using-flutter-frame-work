import 'package:flutter/material.dart';

class ViewStatusBkng extends StatefulWidget {
  const ViewStatusBkng({super.key});

  @override
  State<ViewStatusBkng> createState() => _ViewStatusBkngState();
}

class _ViewStatusBkngState extends State<ViewStatusBkng> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('View Status Booking'),
      ),
    );
  }
}
