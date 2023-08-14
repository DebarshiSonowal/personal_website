import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/models.dart';
import 'package:portfolio/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://drive.google.com/file/d/1dHf_eMAnBUEVashGUo4_sf_tNILBqpqd/view?usp=sharing''';

  static final gitSafeC19 = '''https://github.com/jeeva-HBK/SafeC19''';

  // static final gitHermarts = '''https://github.com/jeeva-HBK/SafeC19''';
  static final gitWtIot = '''https://github.com/jeeva-HBK/AutoChem''';
  static final gitAutoStabilizer =
      '''https://github.com/jeeva-HBK/AutoStabilizer''';
  static final gitPAT = '''https://github.com/jeeva-HBK/PAT''';

  // static final gitAVM = '''https://github.com/jeeva-HBK/SafeC19''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "Guwahati Plus",
        projectContent:
            "The G Plus app provides a comprehensive platform for Latest News, Videos, and Special Features focused on Guwahati, including exclusive content and community engagement.",
        tech1: "Flutter",
        tech2: "Firebase",
        tech3: "Eazebuzz"),
    WorkModel(
      projectTitle: "Tratri",
      projectContent:
          "Tratri celebrates everyday heroes and diverse histories, offering a comfortable reading experience through the Tratri App.",
      tech1: "Flutter",
      tech2: "RazorPay",
      tech3: "Firebase",
    ),
    WorkModel(
        projectTitle: "NIRI9",
        projectContent:
            "Your ultimate app for regional language movies, web series, and short films, bridging the gap between creators and Indian audiences.",
        tech1: "Flutter",
        tech2: "Android & IOS",
        tech3: "API"),
    WorkModel(
        projectTitle: "POS",
        projectContent:
            '''An affordable, all-in-one POS solution catering to the needs of small restaurants. Through this application, we can run analytics and provide the data''',
        tech1: "Flutter",
        tech2: "Android",
        tech3: "Java"),
    WorkModel(
      projectTitle: "CM Appointments App",
      projectContent:
          "Efficient appointment app empowering the Assam Chief Minister to manage meeting requests seamlessly from his device.",
      tech1: "Flutter",
      tech2: "Android & IOS",
      tech3: "API",
    ),
    WorkModel(
      projectTitle: "Apna Team",
      projectContent:
          "Unleash your sports expertise with our fantasy app, where you draft, strategize, and compete for ultimate glory.",
      tech1: "Flutter",
      tech2: "Android",
      tech3: "Fantasy Sport API",
    ),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(url,
            body: {"name": name, "contactInfo": contact, "message": msg})
        .timeout(Duration(seconds: 10));
    print(response.body);
    return response.statusCode == 200;
  }
}
