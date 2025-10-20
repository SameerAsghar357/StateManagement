import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FetchdataScreen extends StatelessWidget {
  FetchdataScreen({super.key});

  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Screen', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     children: [
          //       Text(
          //         'All Data in Firebase Database',
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          //       ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Stream Builder Way', style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  // list.add(map.values);
                  list = map.values.toList();
                  return ListView.builder(
                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index]['title']),
                            Text(list[index]['id']),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Firebase Animated Builder Way',
              style: TextStyle(fontSize: 18),
            ),
          ),

          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                if (snapshot.children.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return Card(
                  // tileColor: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.child('title').value.toString()),
                        Text(snapshot.child('id').value.toString()),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
