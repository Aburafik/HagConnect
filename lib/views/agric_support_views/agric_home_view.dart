import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hag_connect_app/utils/app_colors.dart';
import 'package:hag_connect_app/utils/widgets.dart';

class AgricSupportHomeView extends StatefulWidget {
  const AgricSupportHomeView({Key? key}) : super(key: key);

  @override
  State<AgricSupportHomeView> createState() => _AgricSupportHomeViewState();
}

class _AgricSupportHomeViewState extends State<AgricSupportHomeView> {
  bool isFarmer = true;
  bool isPaultryFarmer = false;
  bool isPickFarmer = false;
  bool generalSupport = false;
  String widgetSelected = "farmer";
  Color defaultColor = const Color(0xFF214724).withOpacity(.3);
  Color activeColor = Colors.red.withOpacity(.4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AGRIC SUPPORT"),
      ),
      endDrawer: HomeDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 7,
            color: generalPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AGRIC",
                  style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Selct Support Type",
                  style: TextStyle(color: fadeWhiteColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    supportSelector(
                      icon: FontAwesomeIcons.galacticRepublic,
                      color: isFarmer ? activeColor : defaultColor,
                      onTap: () {
                        setState(() {
                          widgetSelected = "farmer";
                          isFarmer = true;
                          isPaultryFarmer = false;
                          isPickFarmer = false;
                          generalSupport = false;
                        });
                      },
                    ),
                    supportSelector(
                      icon: FontAwesomeIcons.cloudMoonRain,
                      color: isPaultryFarmer ? activeColor : defaultColor,
                      onTap: () {
                        setState(() {
                          widgetSelected = "generalSupport";
                          isFarmer = false;
                          isPaultryFarmer = true;
                          isPickFarmer = false;
                          generalSupport = false;
                        });
                      },
                    ),
                    supportSelector(
                      icon: Icons.share,
                      color: isPickFarmer ? activeColor : defaultColor,
                      onTap: () {
                        setState(() {
                          // widgetSelected = "share";
                          isFarmer = true;
                          isPaultryFarmer = false;
                          isPickFarmer = false;
                          generalSupport = false;
                        });
                        Navigator.push(context, router("share"));
                      },
                    ),
                    supportSelector(
                      icon: FontAwesomeIcons.phone,
                      color: generalSupport ? activeColor : defaultColor,
                      onTap: () {
                        setState(() {
                          widgetSelected = "call";
                          isFarmer = false;
                          isPaultryFarmer = false;
                          isPickFarmer = false;
                          generalSupport = true;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          swichWidget(widgetSelected)
        ],
      ),
    );
  }
}

supportSelector({IconData? icon, Color? color, Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Material(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: whiteColor,
          ),
        ),
      ),
    ),
  );
}

///Display farmer widget
