import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hag_connect_app/utils/app_colors.dart';
import 'package:hag_connect_app/utils/widgets.dart';

class HealthSupportHomeView extends StatefulWidget {
  const HealthSupportHomeView({Key? key}) : super(key: key);

  @override
  State<HealthSupportHomeView> createState() => _HealthSupportHomeViewState();
}

class _HealthSupportHomeViewState extends State<HealthSupportHomeView> {
  bool isFarmer = true;
  bool isPaultryFarmer = false;
  bool isPickFarmer = false;
  bool generalSupport = false;
  String widgetSelected = "general";
  Color defaultColor = const Color(0xFF214724).withOpacity(.3);
  Color activeColor = Colors.red.withOpacity(.4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Health SUPPORT"),
      ),
      endDrawer: const HomeDrawer(),
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
                  "Helath",
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
                      icon: FontAwesomeIcons.stethoscope,
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
                      icon: Icons.coronavirus,
                      color: isPaultryFarmer ? activeColor : defaultColor,
                      onTap: () {
                        setState(() {
                          widgetSelected = "corona updates";
                          isFarmer = false;
                          isPaultryFarmer = true;
                          isPickFarmer = false;
                          generalSupport = false;
                        });
                      },
                    ),
                    supportSelector(
                      icon: FontAwesomeIcons.phone,
                      color: generalSupport ? activeColor : defaultColor,
                      onTap: () {
                        setState(() {
                          widgetSelected = "ambulance";
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
          swichHealthWidget(widgetSelected)
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
