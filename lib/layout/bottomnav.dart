import 'package:flutter/material.dart';

class bottomnav_ptn extends StatefulWidget {
  const bottomnav_ptn({Key? key}) : super(key: key);

  @override
  State<bottomnav_ptn> createState() => _bottomnav_ptnState();
}

class _bottomnav_ptnState extends State<bottomnav_ptn> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          print(_currentIndex);
          if (_currentIndex == 0) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/bookslot');
          } else if (_currentIndex == 1) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/postcomplaint');
          } else if (_currentIndex == 2) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/viewbookingstatus');
          } else if (_currentIndex == 3) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/eeeeee');
          } else if (_currentIndex == 4) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/viewnotificatiion');
          } else if (_currentIndex == 5) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/viewpmr');
            // } else if (_currentIndex == 6) {
            //   Navigator.pop(context);
            //   Navigator.pushNamed(context, '/viewbookingstatus');
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          label: 'Booking',
          icon: Icon(Icons.book_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Complaint',
          icon: Icon(Icons.dangerous_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Booking status',
          icon: Icon(Icons.admin_panel_settings_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Update profile',
          icon: Icon(Icons.person_2_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Notification',
          icon: Icon(Icons.notification_add_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Pmr',
          icon: Icon(Icons.report_off_rounded),
        ),
        // BottomNavigationBarItem(
        //   label: 'Booking status',
        //   icon: Icon(Icons.verified_rounded),
        // ),
      ],
    );
    ;
  }
}
