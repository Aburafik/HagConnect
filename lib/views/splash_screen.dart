import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hag_connect_app/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle appTitleStyle=Theme.of(context).textTheme.headline2!.copyWith(color:whiteColor,fontSize: 20,);
    return Scaffold(
    
      body: Container(
        color: generalPrimaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.05,
                backgroundColor: whiteColor,
                child: Icon(
                  FontAwesomeIcons.crow,
                  color: generalPrimaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("HagConnect",style: appTitleStyle,),
              ),
              Text("connecting to Agric and Health expect",style: appTitleStyle.copyWith(fontSize: 17,color:fadeWhiteColor ),)
            ],
          ),
        ),
      ),
    );
  }
}
