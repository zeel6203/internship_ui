import 'package:flutter/material.dart';
import 'package:internship_ui/homescreen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomeScreen()));
}

// class home extends StatelessWidget {
//   const home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         bottomNavigationBar: Convex(
//           elevation: 200,
//           backgroundColor: Colors.yellow,
//           fixedColor: Colors.red,
//           type: BottomNavigationBarType.fixed,
//
//           items: [
//
//             // BottomNavigationBarItem(
//             //     icon: Image.asset('assets/img.png'), label: "List",),
//             // BottomNavigationBarItem(
//             //     icon: Image.asset('assets/img.png'), label: "List"),
//             BottomNavigationBarItem(
//                 icon: Image.asset('assets/img.png'), label: "List"),
//             BottomNavigationBarItem(
//                 icon: Image.asset('assets/bookmark.png'), label: "List",),
//             // BottomNavigationBarItem(
//             //     icon: Image.asset('assets/img.png'), label: "List")
//           ],
//         ),
//       ),
//     );
//   }
// }
