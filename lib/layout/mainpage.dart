import 'package:doctor_consulting_app/layout/bottomnav.dart';
import 'package:doctor_consulting_app/layout/chatbot.dart';
import 'package:doctor_consulting_app/layout/pateint_raw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  // static const data = [
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/VK/FQ/EG/17769549/ap0015.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/RL/ZT/GR/17769549/bkt001-5347-1000x1000.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/TE/IH/KW/17769549/bkt00125-1000x1000.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/OZ/MM/UW/17769549/bkt0041--1000x1000.jpg"
  // ];
  var label = ['Home', 'Page1', 'Page2', 'Page3', 'Page4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 19, 93, 172),
          // automaticallyImplyLeading: false,
          title: const Text('CARE 360'),
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        drawer: patientdraw(),
        bottomNavigationBar: bottomnav_ptn(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/—Pngtree—health services in mobile application_5345140.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  child: Icon(Icons.chat_bubble_outline),
                ),
              ),
            ),
          ],
        )

        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),

        //   child: GridView.count(
        //     crossAxisCount: 4,
        //     childAspectRatio: 0.5,
        //     children: List.generate(
        //       data.length,
        //           (index) => Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: GestureDetector(
        //           child: Card(
        //             child: Column(
        //               children: [
        //                 Image.network(data[index]),
        //                 Padding(
        //                   padding: const EdgeInsets.all(10.0),
        //                   child: Text('${label[index]}'),
        //                 ),
        //
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
