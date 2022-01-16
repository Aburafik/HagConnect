import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hag_connect_app/utils/app_colors.dart';
import 'package:hag_connect_app/utils/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.adjust_rounded),
        title: const Text("HagConnect"),
      ),
      //  body: ,
      body: const SelectService(),
      endDrawer: const HomeDrawer(),
    );
  }
}

class SelectService extends StatelessWidget {
  const SelectService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 4,
          vertical: MediaQuery.of(context).size.height / 10,
        ),
        itemCount: categoryProperties.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // crossAxisSpacing: 20,
            mainAxisSpacing: MediaQuery.of(context).size.height / 10,
            crossAxisCount: 1),
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context, router(categoryProperties[index]["fieldName"]));
              },
              child: Card(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        categoryProperties[index]["icon"],
                        size: 40,
                        color: categoryIconColor,
                      ),
                      Text(
                        categoryProperties[index]["fieldName"],
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  // color: genralColor,
                ),
              ),
            ));
  }
}

