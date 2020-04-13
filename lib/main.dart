import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() {
  runApp(MyApp());
}

//This is how I'll manage the app native UI on different platform

//class MyApp extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return Platform.isAndroid
//        ? MaterialApp()
//        : Platform.isIOS
//            ? CupertinoApp()
//            : Text("This App is not supported for this platform");
//  }
//}

//Let's learn something about IOS widgets
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: HomePage(),
    );
  }
}

//cupertino navigation bar
//App bar with centered title
//like in IOS

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, Widget> segments = {
    "One": Text("One"),
    "two": Text("Two"),
    "three": Text("Three"),
  };

  double sliderValue = 20;

  bool switchValue = false;
  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoContextMenu(
          child: Icon(CupertinoIcons.group),
          actions: <Widget>[
            CupertinoContextMenuAction(
              child: Text("Like whatsapp"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        middle: Text("Longs press the icon-->"),
      ),
      //in material app if you have appbar
      //then it automatically counts the
      //height of the status bar
      //and add to the appbar itself, so no need of safe area
      //but in iOS, I think it is required to wrap the widgets
      // in safe area
      //even if there is appbar or say CupertinoNavBar
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Material(
              child: ListTile(
                title: Text("Cupertino Action Sheet"),
                trailing: Text(
                  'Show',
                  style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                ),
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          cancelButton: CupertinoButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          title: Text("Choose Theme"),
                          message: Text("Choose colors"),
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context, 'red');
                              },
                              child: Text("Red"),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context, 'yellow');
                              },
                              child: Text("Yellow"),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context, 'blue');
                              },
                              child: Text("Blue"),
                            )
                          ],
                        );
                      });
                },
              ),
            ),
            Material(
              child: ListTile(
                title: Text("Cupertino Dialog"),
                trailing: Text(
                  'Show',
                  style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                ),
                onTap: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Permission"),
                          content: Text("App is required contact permisions"),
                          actions: <Widget>[
                            CupertinoButton(
                              child: Text("Don't Allow"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoButton(
                              child: Text("Allow"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
            Material(
              color: CupertinoColors.white,
              child: ListTile(
                title: Text("Cupertino Date picker"),
                trailing: Text(
                  "Show",
                  style:
                      CupertinoTheme.of(context).textTheme.navActionTextStyle,
                ),
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          cancelButton: CupertinoButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          message: Container(
                            height: MediaQuery.of(context).size.height * 0.30,
                            child: CupertinoDatePicker(
                                onDateTimeChanged: (changedDate) {
                              print("date: $changedDate");
                            }),
                          ),
                        );
                      });
                },
              ),
            ),
            Material(
              child: ListTile(
                title: Text("Cupertino Dialog Actions"),
                trailing: Text(
                  "Show",
                  style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                ),
                onTap: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                            title: Text("lorem ipsum"),
                            content: CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Blah"),
                            ));
                      });
                },
              ),
            ),
            Material(
              child: ListTile(
                title: Text("Cupertino Picker"),
                trailing: Text(
                  "Show",
                  style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                ),
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: CupertinoPicker(
                              itemExtent: 36.0,
                              onSelectedItemChanged: (changed) {},
                              children: [
                                Text("Again Colors"),
                                Text("Again Colors"),
                                Text("Again Colors"),
                                Text("Again Colors"),
                                Text("Again Colors"),
                                Text("Again Colors"),
                              ]),
                        );
                      });
                },
              ),
            ),
            Material(
              child: ListTile(
                title: Text("Cupertino Segmental Control"),
                onTap: () {
                  setState(() {
                    isShown = !isShown;
                  });
                },
                trailing: Text(
                  'Show',
                  style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                ),
              ),
            ),
            isShown
                ? CupertinoSegmentedControl(
                    onValueChanged: (String value) {},
                    children: segments,
                  )
                : Container(),
            Material(
              child: ListTile(
                title: Text("Slider"),
                subtitle: CupertinoSlider(
                    max: 100,
                    min: 0,
                    value: sliderValue,
                    onChanged: (vale) {
                      setState(() {
                        sliderValue = vale;
                      });
                    }),
              ),
            ),
            Material(
              child: ListTile(
                title: Text("Cupertino Switch"),
                trailing: CupertinoSwitch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
