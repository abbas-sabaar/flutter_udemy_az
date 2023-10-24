

void printFullText(text) {
  final pattern = RegExp('.{1,800}'); // 800 si the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

// void signOut(context) => CacheHelper.removeData(
//   key: 'token',
// ).then((value) {
//   if (value) {
//     navigateAndFinish(context, ShopLoginScreen());
//   }
// });
// String? token;
// String? uId;


// POST
// UPDATE
// DELETE

// GET


// base url : https://newsapi.org/
// method (url) v2/top-headlines?
// queries country=eg&category=business&apiKey=dbc06a8a43044e2397982881f5388160







// class Taspeh extends StatefulWidget {
//   @override
//   State<Taspeh> createState() => _TaspehState();
// }
//
// enum prayMode {
//   open,
//   alzhare,
// }
//
// class _TaspehState extends State<Taspeh> {
//   int counter = 0;
//   int index = 0;
//   bool isMail = false;
//   List<String> string = [
//     'الله اكبر',
//     'الحمد الله',
//     'سبحان الله',
//   ];
//
//   prayMode? mode;
//
//   @override
//   void initState() {
//     super.initState();
//     mode = prayMode.alzhare;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'سيد الاستغفار',
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.replay,
//             ),
//             onPressed: () {
//               setState(() {
//                 counter = 0;
//               });
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 120.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isMail = true;
//                               mode = prayMode.open;
//                             });
//                           },
//                           child: Container(
//                             color: isMail ? Colors.teal : Colors.grey[300],
//                             child: Text(
//                               ' التسبيح المفتوح',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 25.0),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isMail = false;
//                               mode = prayMode.alzhare;
//                             });
//                           },
//                           child: Container(
//                             color: !isMail ? Colors.teal : Colors.grey[300],
//                             child: Text(
//                               'تسبيح الزهراء',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 50.0),
//                     if (mode == prayMode.alzhare)
//                       Text(
//                         string[index],
//                         style: TextStyle(
//                           fontSize: 35.0,
//                           // wordSpacing: 7.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     SizedBox(height: 50.0),
//                     Center(
//                       child: Text(
//                         counter.toString(),
//                         style: TextStyle(
//                           fontSize: 50.0,
//
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 150.0),
//                     Container(
//                       width: 150.0,
//                       height: 70.0,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                           10.0,
//                         ),
//                         color: Colors.teal,
//                       ),
//                       child: MaterialButton(
//                         onPressed: incrementCounter,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Icon(
//                             //   Icons.touch_app,
//                             //   color: Colors.white,
//                             //   size: 65.0,
//                             // ),
//                             // SizedBox(width: 15.0),
//                             Text(
//                               "تسبيح",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Container(
//               //   width: 150.0,
//               //   height: 40.0,
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(
//               //       10.0,
//               //     ),
//               //     color: Colors.teal,
//               //   ),
//               //   child: Row(
//               //     children: [
//               //       IconButton(
//               //         icon: Icon(
//               //           Icons.settings_backup_restore,
//               //           color: Colors.white,
//               //         ),
//               //         onPressed: () {},
//               //       ),
//               //       Text(
//               //         'تصفير العداد',
//               //         style: TextStyle(
//               //           fontSize: 18.0,
//               //           color: Colors.white,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void incrementCounter() {
//     setState(() {
//       counter++;
//       if (mode == prayMode.alzhare) if (index == 0 && counter == 35) {
//         index = 1;
//         counter = 0;
//       } else if (index == 1 && counter == 34) {
//         index = 2;
//         counter = 0;
//       } else if (index == 2 && counter == 34) {
//         index = 0;
//         counter = 0;
//       }
//     });
//   }
// }
