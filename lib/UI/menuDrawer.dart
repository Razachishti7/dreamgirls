// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 205, 203, 203)),
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
            height: 10,
          ),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}

class FieldHeadingRichText extends StatelessWidget {
  String text;
  double textSize;
  String secondText;
  FieldHeadingRichText(this.text, this.textSize, this.secondText, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: textSize),
        children: <TextSpan>[
          TextSpan(
            text: secondText,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ],
      ),
    );
  }
}

class FieldHeadingRichTextNormal extends StatelessWidget {
  String text, secondText;
  FieldHeadingRichTextNormal(this.text, this.secondText, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
            color: Color.fromARGB(255, 108, 107, 107),
            fontWeight: FontWeight.normal,
            fontSize: 12),
        children: <TextSpan>[
          TextSpan(
            text: secondText,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 255, 0, 0)),
          ),
        ],
      ),
    );
  }
}

class FieldTextWidget extends StatefulWidget {
  final TextEditingController myController;
  String hintText;
  FieldTextWidget(this.hintText, this.myController, {super.key});

  @override
  State<FieldTextWidget> createState() => _FieldTextWidgetState();
}

class _FieldTextWidgetState extends State<FieldTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.myController,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        focusColor: const Color.fromARGB(255, 113, 113, 113),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey, //this has no effect
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: widget.hintText,
      ),
    );
  }
}

class FieldHeadingRichTextNormal2 extends StatelessWidget {
  String text, secondText;
  FieldHeadingRichTextNormal2(this.text, this.secondText, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
            color: Color.fromARGB(255, 108, 107, 107),
            fontWeight: FontWeight.normal,
            fontSize: 12),
        children: const [
          WidgetSpan(
            child: Icon(
              Icons.info_outline,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}
