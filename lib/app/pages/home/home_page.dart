import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/custom_switch_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            controller.getTime();
          }),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomSwitchwidget(),
            ValueListenableBuilder(
                valueListenable: controller.time,
                builder: (context, model, child) {
                  if (model?.text == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text(model.text);
                })
          ],
        ),
      ),
    );
  }
}
