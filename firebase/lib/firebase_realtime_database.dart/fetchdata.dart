import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FetchdataScreen extends StatefulWidget {
  FetchdataScreen({super.key});

  @override
  State<FetchdataScreen> createState() => _FetchdataScreenState();
}

class _FetchdataScreenState extends State<FetchdataScreen> {
  final auth = FirebaseAuth.instance;

  final ref = FirebaseDatabase.instance.ref('Post');

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Screen', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('title').value.toString();

                if (searchController.text.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.grey.shade600,
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Update'),
                                      content: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Write Here',
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Update'),
                                          onPressed: () {},
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Update'),
                                      content: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Write Here',
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Update'),
                                          onPressed: () {},
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ),
                            ),
                          ];
                        },
                      ),
                    ),
                  );
                } else if (title.toString().toLowerCase().contains(
                  searchController.text.toLowerCase(),
                )) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.grey.shade600,
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Update'),
                                      content: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Write Here',
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Update'),
                                          onPressed: () {},
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Update'),
                                      content: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: 'Write Here',
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Update'),
                                          onPressed: () {},
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ),
                            ),
                          ];
                        },
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Column(
        // children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     children: [
          //       Text(
          //         'All Data in Firebase Database',
          //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          //       ),
          // SizedBox(height: 20),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text('Stream Builder Way', style: TextStyle(fontSize: 18)),
          // ),
          // Expanded(
          //   child: StreamBuilder(
          //     stream: ref.onValue,
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return Center(child: CircularProgressIndicator());
          //       } else {
          //         Map<dynamic, dynamic> map =
          //             snapshot.data!.snapshot.value as dynamic;
          //         List<dynamic> list = [];
          //         // list.add(map.values);
          //         list = map.values.toList();
          //         return ListView.builder(
          //           itemCount: snapshot.data!.snapshot.children.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(list[index]['title']),
          //                   Text(list[index]['id']),
          //                 ],
          //               ),
          //             );
          //           },
          //         );
          //       }
          //     },
          //   ),
          // ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Firebase Animated Builder Way',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
