import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stateManagement/WsCube_Provider/add_data_provider.dart';
import 'package:provider_stateManagement/WsCube_Provider/add_data_screen.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => AddDataProvider(),
//       child: MyApp(),
//     ),
//   );
// }
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AddDataProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AddDataScreen());
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChangeNotifierProvider(
//         create: (context) => AddDataProvider(),
//         child: AddDataScreen(),
//       ),
//     );
//   }
// }
