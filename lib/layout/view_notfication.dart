import 'package:flutter/material.dart';

class ViewNotfication extends StatefulWidget {
  const ViewNotfication({super.key});

  @override
  State<ViewNotfication> createState() => _ViewNotficationState();
}

class _ViewNotficationState extends State<ViewNotfication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('View notification'),
      ),
    );
  }
}
