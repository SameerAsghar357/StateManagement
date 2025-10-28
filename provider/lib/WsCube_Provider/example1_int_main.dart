


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_stateManagement/example_1_counter_provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChangeNotifierProvider(
//         create: (_) => CounterProvider(),
//         child: MainFile(),
//       ),
//     );
//   }
// }

// class MainFile extends StatelessWidget {
//   const MainFile({super.key});

//   // int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     print('build function called');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Center(
//         child: Consumer(
//           builder: (ctx, _, __) {
//             print('consumer function called');
//             // 1st Way
//             // return Text(
//             //   '${Provider.of<CounterProvider>(ctx, listen: true).getValue()}',
//             //   style: TextStyle(fontSize: 35),
//             // );
//             // 2nd Way
//             // Alway take care of context which one you are using
//             return Text(
                  // watch<reference>() function always have listen true
//               '${ctx.watch<CounterProvider>().getValue()}',
//               style: TextStyle(fontSize: 35),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           // SizedBox(width: 0),
//           FloatingActionButton(
//             onPressed: () {
//               // 1st Way
//               // Provider.of<CounterProvider>(context, listen: false).decrement();
//               // 2nd way
                // read<reference>() function always have listen false
//               context.read<CounterProvider>().decrement();
//             },
//             child: Icon(Icons.remove),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               // 1st Way
//               // Provider.of<CounterProvider>(context, listen: false).increment();
//               // 2nd way
//               context.read<CounterProvider>().increment();
//             },
//             child: Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }
