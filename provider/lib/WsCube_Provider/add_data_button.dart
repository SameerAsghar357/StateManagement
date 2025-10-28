import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stateManagement/WsCube_Provider/add_data_provider.dart';

class AddDataButton extends StatelessWidget {
  AddDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello')),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<AddDataProvider>().addData();
            // ctx.read<>()
          },
          icon: Icon(Icons.add),
          iconSize: 30,
        ),
      ),
    );
  }
}
