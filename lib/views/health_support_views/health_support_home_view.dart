import 'package:flutter/material.dart';
import 'package:hag_connect_app/utils/widgets.dart';

class HealthSupportHomeView extends StatelessWidget {
  const HealthSupportHomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Health Home"),),
       endDrawer: HomeDrawer(),
    );
  }
}