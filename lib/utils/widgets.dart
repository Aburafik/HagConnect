import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hag_connect_app/utils/app_colors.dart';
import 'package:hag_connect_app/views/agric_support_views/agric_home_view.dart';
import 'package:hag_connect_app/views/health_support_views/health_support_home_view.dart';
import 'package:hag_connect_app/views/homeview/home_view.dart';

List categoryProperties = [
  {"fieldName": "Agric Support", "icon": FontAwesomeIcons.cuttlefish},
  {"fieldName": "Health Support", "icon": FontAwesomeIcons.stethoscope}
];

///Home view router function
router(selectRoute) {
  switch (selectRoute) {
    case "Agric Support":
      return MaterialPageRoute(builder: (_) => const AgricSupportHomeView());
    case "Health Support":
      return MaterialPageRoute(builder: (_) => const HealthSupportHomeView());
    case "share":
      return MaterialPageRoute(builder: (_) => const ShareDialyMessage());

    default:
      MaterialPageRoute(builder: (_) => const HomeView());
  }
}

displayFarmer() {
  return Expanded(
    child: Container(
      color: const Color(0xffF5F5F5),
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Text(
            "Farm Support",
            style: TextStyle(fontSize: 20, color: categoryIconColor),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
                "We would love to hear from you and you been doing at your farm. Laeve us a message and we will get back to you as sooon as possible"),
          ),
          reUseableTitleTextformField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: reUseableMainMesageTextformField(),
          ),
          reUseableButton(onPressed: () {}, title: "Send")
        ],
      ),
    ),
  );
}

displayGeneralSupport() {
  return Expanded(
    child: Container(
      color: whiteColor,
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Text(
            "General Support",
            style: TextStyle(fontSize: 20, color: categoryIconColor),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
                "We would love to hear from you and you been doing at your farm. Laeve us a message and we will get back to you as sooon as possible"),
          ),
          reUseableTitleTextformField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: reUseableMainMesageTextformField(),
          ),
          reUseableButton(onPressed: () {}, title: "Send")
        ],
      ),
    ),
  );
}

displayCallSupport() {
  return Expanded(
    child: Container(
      child: Column(
        children: [
          Text("Reach all departments via phone"),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                elevation: 1,
                child: ListTile(
                  title: Text("Dep. name"),
                  leading: Icon(
                    Icons.support_agent,
                    color: generalPrimaryColor,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.phone,
                      color: generalPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

reUseableTitleTextformField() {
  return TextField(
    decoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        labelText: "Message Title",
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
  );
}

reUseableMainMesageTextformField() {
  return TextField(
    maxLines: 6,
    decoration: InputDecoration(
        labelText: "Message Title",
        filled: true,
        fillColor: whiteColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
  );
}

swichWidget(widgetSelected) {
  switch (widgetSelected) {
    case "farmer":
      return displayFarmer();
    case "generalSupport":
      return displayGeneralSupport();
    case "call":
      return displayCallSupport();

    default:
      return displayGeneralSupport();
  }
}

///Drawer for all screens
class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle appTitleStyle = Theme.of(context).textTheme.headline2!.copyWith(
          color: whiteColor,
          fontSize: 20,
        );

    return Drawer(
      child: Container(
        color: generalPrimaryColor,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.1,
              color: generalPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
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
                    child: Text(
                      "HagConnect",
                      style: appTitleStyle,
                    ),
                  ),
                  Text(
                    "connecting to Agric and Health expect",
                    style: appTitleStyle.copyWith(
                        fontSize: 17, color: fadeWhiteColor),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: whiteColor,
                child: Column(
                  children: [
                    DrawerItems(
                      title: "Home",
                      icon: Icons.home,
                      ontap: () {},
                    ),
                       DrawerItems(
                      title: "History",
                      icon: Icons.history,
                      ontap: () {},
                    ),
                       DrawerItems(
                      title: "Email",
                      icon:Icons.email,
                      ontap: () {},
                    ), DrawerItems(
                      title: "Disclaimer",
                      icon: Icons.notifications_none_outlined,
                      ontap: () {},
                    ), DrawerItems(
                      title: "CopyRight",
                      icon: Icons.copyright,
                      ontap: () {},
                    ),
                    DrawerItems(
                      title: "FAQ",
                      icon: FontAwesomeIcons.question,
                      ontap: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  String? title;
  IconData? icon;
  Function()? ontap;

  DrawerItems({Key? key, this.title, this.icon, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Icon(icon, color: generalSecondaryColor),
      title: Text(
        title!,
        style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7)),
      ),
    );
  }
}

reUseableButton({String? title, Function()? onPressed}) {
  return MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    padding: EdgeInsets.symmetric(vertical: 14),
    onPressed: onPressed,
    color: generalPrimaryColor,
    child: Text(
      title!,
      style: TextStyle(color: whiteColor),
    ),
  );
}

class ShareDialyMessage extends StatelessWidget {
  const ShareDialyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle shareStyle = Theme.of(context).textTheme.headline2!.copyWith(
        color: generalPrimaryColor, fontSize: 35, fontWeight: FontWeight.w600);
    TextStyle appTitleStyle = Theme.of(context).textTheme.headline2!.copyWith(
          color: whiteColor,
          fontSize: 20,
        );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Share", style: shareStyle),
            const Text(
                "Every day we share best best farming practices to help you keep you farm in a helath conditon, share it with a friend by clicking the share now button",
                style: TextStyle(
                  height: 1.5,
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: generalSecondaryColor)),
              child: Column(
                children: [
                  Text(
                    "Today",
                    style: shareStyle,
                  ),
                  const Text(
                    """Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos  sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam""",
                    style: TextStyle(
                      height: 1.5,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.crow,
                    color: generalPrimaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "HagConnect",
                      style:
                          appTitleStyle.copyWith(color: generalSecondaryColor),
                    ),
                  ),
                  Text(
                    "connecting to Agric and Health expect",
                    style: appTitleStyle.copyWith(
                        fontSize: 17, color: fadeWhiteColor),
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                actionButtons(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: whiteColor,
                    title: "Cancel"),
                actionButtons(
                  onPressed: () async {
                    await FlutterShare.share(
                        title: 'Example share',
                        text: 'Example share text',
                        linkUrl: 'https://flutter.dev/',
                        chooserTitle: 'Farming Tips of the Day');
                  },
                  title: "Share Now",
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

actionButtons({
  onPressed,
  String? title,
  color,
}) {
  return MaterialButton(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: generalPrimaryColor),
    ),
    onPressed: onPressed,
    color: color == null ? generalPrimaryColor : color,
    child: SizedBox(
      width: 100,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(title!),
      )),
    ),
  );
}

//Health support widgets
swichHealthWidget(widgetSelected) {
  switch (widgetSelected) {
    case "general":
      return displayHealth();
    case "ambulance":
      return displayEmergencySupport();
    case "corona updates":
      return displayCovidReport();

    default:
      return displayHealth();
  }
}

displayHealth() {
  return Expanded(
    child: Container(
      color: const Color(0xffF5F5F5),
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Text(
            "General Helath Support",
            style: TextStyle(fontSize: 20, color: categoryIconColor),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:
                Text("What health challenge are you facing in your locallity?"),
          ),
          reUseableTitleTextformField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: reUseableMainMesageTextformField(),
          ),
          reUseableButton(onPressed: () {}, title: "Send")
        ],
      ),
    ),
  );
}

displayCovidReport() {
  return Expanded(
    child: Container(
      color: const Color(0xffF5F5F5),
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Text(
            "Report a Covid-Case",
            style: TextStyle(fontSize: 20, color: categoryIconColor),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:
                Text("What health challenge are you facing in your locallity?"),
          ),
          reUseableTitleTextformField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: reUseableMainMesageTextformField(),
          ),
          reUseableButton(onPressed: () {}, title: "Send")
        ],
      ),
    ),
  );
}

displayEmergencySupport() {
  return Expanded(
    child: Container(
      child: Column(
        children: [
          Text("Reach all GHS departments via phone"),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                elevation: 1,
                child: ListTile(
                  title: Text("Dep. name"),
                  subtitle: Text("0555144789"),
                  leading: Icon(
                    Icons.support_agent,
                    color: generalPrimaryColor,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.phone,
                      color: generalPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
