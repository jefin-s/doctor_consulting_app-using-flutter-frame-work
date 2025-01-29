// import "package:doctor_consulting_app/layout/Register.dart";
// import "package:doctor_consulting_app/layout/post_complaint.dart";
import "package:doctor_consulting_app/layout/view_notfication.dart";
// import "package:doctor_consulting_app/layout/book_slot.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {'/': (context) => ViewNotfication()},
  ));
}
