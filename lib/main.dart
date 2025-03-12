// import "package:doctor_consulting_app/layout/Register.dart";
// import "package:doctor_consulting_app/layout/post_complaint.dart";
import "package:doctor_consulting_app/layout/Register.dart";
import "package:doctor_consulting_app/layout/book_slot.dart";
import "package:doctor_consulting_app/layout/login.dart";
import "package:doctor_consulting_app/layout/mainpage.dart";
import "package:doctor_consulting_app/layout/post_complaint.dart";
import "package:doctor_consulting_app/layout/update_profile.dart";
import "package:doctor_consulting_app/layout/view_notfication.dart";
import "package:doctor_consulting_app/layout/view_pmr.dart";
import "package:doctor_consulting_app/layout/view_status_bkng.dart";
// import "package:doctor_consulting_app/layout/book_slot.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Viewnotification(),
      // '/bookslot': (context) => Bookslot(),
      // '/postcomplaint': (context) => PostComplaint(),
      // '/patientregister': (context) => Register(),
      // '/updateprofile': (context) => UpdateProfile(),
      // '/viewnotificatiion': (context) => Viewnotification(),
      // '/viewpmr': (context) => Viewpmr(),
      // '/viewbookingstatus': (context) => Viewstatus()
    },
  ));
}
