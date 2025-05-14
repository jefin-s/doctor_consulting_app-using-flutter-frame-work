// import "package:doctor_consulting_app/layout/Register.dart";
// import "package:doctor_consulting_app/layout/post_complaint.dart";
import "package:doctor_consulting_app/layout/Register.dart";
import "package:doctor_consulting_app/layout/book_slot.dart";
import "package:doctor_consulting_app/layout/chatbot.dart";

import "package:doctor_consulting_app/layout/post_complaint.dart";
import "package:doctor_consulting_app/layout/splash.dart";
import "package:doctor_consulting_app/layout/edittt.dart";

import "package:doctor_consulting_app/layout/view_notfication.dart";
import "package:doctor_consulting_app/layout/view_pmr.dart";
import "package:doctor_consulting_app/layout/view_status_bkng.dart";
// import "package:doctor_consulting_app/layout/book_slot.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Splashscreen(),
      '/bookslot': (context) => Bookslot(),
      '/postcomplaint': (context) => PostComplaint(),
      '/patientregister': (context) => Register(),
      '/viewnotificatiion': (context) => Viewnotification(),
      '/viewpmr': (context) => Viewpmr(),
      '/viewbookingstatus': (context) => Viewstatus(),
      '/eeeeee': (context) => EditProfile(),
    },
  ));
}
