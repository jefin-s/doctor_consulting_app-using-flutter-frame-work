import 'package:doctor_consulting_app/layout/login.dart';
import 'package:flutter/material.dart';

class patientdraw extends StatefulWidget {
  const patientdraw({Key? key}) : super(key: key);

  @override
  State<patientdraw> createState() => _patientdrawState();
}

class _patientdrawState extends State<patientdraw> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      backgroundImage: AssetImage(
                          'assets/images/freepik-linear-heart-care-clinic-logo-20250306063947FjfO.png'),
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                      child: Text(
                        'Careconsult360',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
                alignment: AlignmentDirectional.center,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 26, 48),
              ),
            ),

            // ListTile(
            //   leading: Icon(Icons.note_add),
            //   title: Text('Register'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/patientregister');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.book_online),
              title: Text('Update_profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/eeeeee');
              },
            ),
            ListTile(
              leading: Icon(Icons.book_online),
              title: Text('Booking'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/bookslot');
              },
            ),
            ListTile(
              leading: Icon(Icons.notification_add),
              title: Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewnotificatiion');
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('pmr'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewpmr');
              },
            ),
            ListTile(
              leading: Icon(Icons.mark_chat_read),
              title: Text('Booking_status'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/viewbookingstatus');
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Logout'),
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
