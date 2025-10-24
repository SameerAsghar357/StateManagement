import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainFile(),
    );
  }
}

class MainFile extends StatefulWidget {
  const MainFile({super.key});

  @override
  State<MainFile> createState() => _MainFileState();

}

int count = 0;

class _MainFileState extends State<MainFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Provider', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(child: Text('$count', style: TextStyle(fontSize: 35))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
              debugPrint('$count');
            });
          },
          child: Icon(Icons.add),
        ),
      );
  }
}
