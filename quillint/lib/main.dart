import 'package:flutter/material.dart';
import 'package:quillint/screens/wrapper.dart';

void main() {
  runApp(MaterialApp(
    home: Wrapper(),
  ));
}

// 
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(30),
//           child: Column(
//             children: [
//               SizedBox(height:250),
//               Text(
//                 'QUILLINT',
//                 style: TextStyle(
//                   color: Colors.amber[600],
//                   letterSpacing: 2,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 40,
//                   fontFamily: 'Caveat',
//                 ),
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// 