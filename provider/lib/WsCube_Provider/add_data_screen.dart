import 'package:flutter/material.dart';
import 'package:provider_stateManagement/WsCube_Provider/add_data_button.dart';
import 'package:provider_stateManagement/WsCube_Provider/add_data_provider.dart';
import 'package:provider/provider.dart';

class AddDataScreen extends StatelessWidget {
  AddDataScreen({super.key});

  final nameController = TextEditingController();
  final numberController = TextEditingController();

  // Map<String, dynamic> mapData = {'name': 'contactName', 'cntNo': 03245651896};

  // List<Map<String, dynamic>> _tempMap = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    debugPrint('builder function called');
    return Scaffold(
      appBar: AppBar(title: Text('HomePage'), centerTitle: true),
      body: Consumer<AddDataProvider>(
        // builder: (ctx, _, __) { // ctx => with context ewxample
        //   var allData = ctx.watch<AddDataProvider>().getMapData();
        builder: (_, provider, __) {
          // provider => with Provider example
          var allData = provider.getMapData();
          return ListView.builder(
            itemCount: allData.length,
            itemBuilder: (_, index) {
              // _tempMap = context.watch<AddDataProvider>().getMapData();
              return ListTile(
                title: Text(allData[index]['name'].toString()),
                subtitle: Text(allData[index]['contactNumber'].toString()),
                trailing: Container(
                  // color: Colors.amber,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          nameController.text = allData[index]['name']
                              .toString();
                          numberController.text =
                              allData[index]['contactNumber'].toString();
                          showDialog(
                            context: (context),
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Edit'),
                                content: Container(
                                  height: height * 0.14,
                                  width: width * 0.8,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          hintText: 'Edit Name',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: numberController,
                                        decoration: InputDecoration(
                                          hintText: 'Edit Number',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      provider.updateData(
                                        index,
                                        nameController.text,
                                        numberController.text,
                                      );
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          backgroundColor:
                                              Colors.blueGrey.shade200,
                                          duration: Duration(seconds: 2),
                                          content: Text(
                                            'Updated',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('Update'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<AddDataProvider>().deleteData(index);
                        },
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () {
        //   _mapDataList.add({'name': 'contactName', 'cntNo': 03245651896});
        // },
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDataButton(),
            ),
          );
          // debugPrint('button pressed');
          // context.read<AddDataProvider>().addData();
          // _mapDataList.add(mapData);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
