
// import 'package:flutter/material.dart';
// import 'package:schoolpenintern/Screens/StartupDashBord/constants/ConstantColors.dart';
// import 'package:schoolpenintern/Screens/StartupDashBord/utils/Common_widgets.dart';

// class WhyUseInfoPage extends StatelessWidget {
//   String? selectType;
//   WhyUseInfoPage({super.key, this.selectType});

//   Map<String, Map<String, String>> bannerContent = {
//     "Student": {
//       "title": "Student",
//       "desc":
//           "Eager to learn and grow? Join as a student to access knowledge, engage with peers, and thrive. ",
//       "image": "assets/studentbanner.png"
//     },
//     "Teacher": {
//       "title": "Teacher",
//       "desc":
//           "Inspire and educate the future generation. Opt for the teacher profile to share knowledge and mentor students.",
//       "image": "assets/techerbanner.png"
//     },
//     "Parent": {
//       "title": "Parent",
//       "desc":
//           "Ready to empower your child's education journey? Choose the parent profile to support and monitor progress.",
//       "image": "assets/parentbanner.png"
//     }
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 const SizedBox(
//                   height: 450,
//                 ),
                
//                 Positioned(
//                     top: 170,
//                     right: (MediaQuery.of(context).size.width / 2) - 150,
//                     child: Image.asset("assets/initimages/background_2.png")),
//               ],
//             ),
//             const SizedBox(height: 40),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 24),
//                     child: Text(
//                       "How you gonna use this app?",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 24,
//                         color: ConstantColors.buttonClr,
//                       ),
//                     ),
//                   ),
//                   // banner(
//                   //   context,
//                   //   title: bannerContent[selectType]?['title'],
//                   //   desc: bannerContent[selectType]?['desc'],
//                   //   image: bannerContent[selectType]?['image'],
//                   // ),
//                   // Container(
//                   //     margin: const EdgeInsets.only(top: 60, bottom: 30),
//                   //     child: CustomButton(
                        
//                   //         title: "Submit",
//                   //         height: 60,
//                   //         onClick: () {
//                   //           Navigator.pushNamed(context, '/login');
//                   //         })),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget banner(context, {String? title, String? desc, String? image}) {
//   return Center(
//     child: Container(
//       padding: const EdgeInsets.all(18.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         // image: DecorationImage(
//         //   image: AssetImage("assets/bannerBg.png"),
//         //   fit: BoxFit.cover,
//         //   alignment: Alignment.center,
//         // ),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1, // Adjust flex as needed to control image width
//             child: Image.asset(
//               "$image", // Replace with your image URL
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(width: 16.0), // Add spacing between image and text
//           Expanded(
//             flex: 2, // Adjust flex as needed to control text width
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '$title',
//                   style: const TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white),
//                 ),
//                 const SizedBox(
//                     height: 8.0), // Add spacing between title and description
//                 Text(
//                   '$desc',
//                   style: const TextStyle(
//                     fontSize: 14.0,
//                     height: 1.4,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }