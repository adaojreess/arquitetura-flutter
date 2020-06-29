import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/pages/home/components/custom_switch_widget.dart';
import 'package:arquitetura_flutter/app/pages/home/home_controller.dart';
import 'package:arquitetura_flutter/app/repositories/apidvisor_repository.dart';
import 'package:arquitetura_flutter/app/services/client_http_service.dart';
import 'package:arquitetura_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    ApiadvisorViewModel(
      ApiadvisorRepository(
        ClientHttpService(),
      ),
    ),
  );

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
