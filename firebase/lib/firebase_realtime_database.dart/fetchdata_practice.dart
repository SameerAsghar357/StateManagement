import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FetchdataPractice extends StatefulWidget {
  const FetchdataPractice({super.key});

  @override
  State<FetchdataPractice> createState() => _FetchdataPracticeState();
}

final ref = FirebaseDatabase.instance.ref('Post');

class _FetchdataPracticeState extends State<FetchdataPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fetch Data Practice Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          Text('Firebase AnimatedList'),
          SizedBox(height: 20),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                return ListTile(
                  title: Text(snapshot.child('title').value.toString()),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text('Stream Builder'),
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder(
              // stream: Stream.value(ref),
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as dynamic;
                List<dynamic> list = [];
                list = map.values.toList();
                return ListView.builder(
                  itemCount: snapshot.data!.snapshot.children.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(list[index]['id']),
                          Text(list[index]['title']),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
