import 'package:flutter/material.dart';
import 'menuDrawer.dart';

bool isSwitched = true;
var textValue = 'Switch 0 is OFF';
bool isSwitchedOne = false;
var textValueOne = 'Switch 1 is OFF';

class SwitchButtonSections extends StatefulWidget {
  String titleText, descText;
  Icon iconsData;
  Widget widgetName;
  // bool isSwitched = false;

  // var textValue = 'Switch is OFF';
  SwitchButtonSections({
    required this.titleText,
    required this.descText,
    required this.iconsData,
    required this.widgetName,
    Key? key,
  }) : super(key: key);

  @override
  State<SwitchButtonSections> createState() => _SwitchButtonSectionsState();
}

class _SwitchButtonSectionsState extends State<SwitchButtonSections> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1.5, color: Colors.grey.shade300),
      )),
      child: Padding(
        padding: const EdgeInsets.only(left: 3, top: 10, bottom: 10, right: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.iconsData,
            SizedBox(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldHeadingRichText(widget.titleText, 14, ""),
                  const SizedBox(
                    height: 5,
                  ),
                  FieldHeadingRichTextNormal(widget.descText, "")
                ],
              ),
            ),
            widget.widgetName
          ],
        ),
      ),
    );
  }
}

class SwitchButtonOne extends StatefulWidget {
  const SwitchButtonOne({
    Key? key,
  }) : super(key: key);

  @override
  State<SwitchButtonOne> createState() => _SwitchButtonOneState();
}

class _SwitchButtonOneState extends State<SwitchButtonOne> {
  @override
  Widget build(BuildContext context) {
    void toggleSwitch(bool value) {
      if (isSwitched == false) {
        setState(() {
          isSwitched = true;
          textValue = 'Switch 0 Button is ON';
        });
        print(textValue);
      } else {
        setState(() {
          isSwitched = false;
          textValue = 'Switch 0 Button is OFF';
        });
        print(textValue);
      }
    }

    return Material(
      type: MaterialType.transparency,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Transform.scale(
            scale: 1,
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
              activeColor: Colors.grey,
              activeTrackColor: Colors.black,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.grey,
            )),
      ]),
    );
  }
}

// SWITCH BUTTON SECOND
class SwitchButton extends StatefulWidget {
  const SwitchButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    void toggleSwitch(bool value) {
      if (isSwitchedOne == false) {
        setState(() {
          isSwitchedOne = true;
          textValueOne = 'Switch 1 Button is ON';
        });
        print(textValueOne);
      } else {
        setState(() {
          isSwitchedOne = false;
          textValueOne = 'Switch 1 Button is OFF';
        });
        print(textValueOne);
      }
    }

    return Material(
      type: MaterialType.transparency,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Transform.scale(
            scale: 1,
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitchedOne,
              activeColor: Colors.grey,
              activeTrackColor: Colors.black,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.grey,
            )),
      ]),
    );
  }
}
