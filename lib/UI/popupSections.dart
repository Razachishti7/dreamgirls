import 'package:flutter/material.dart';

import 'menuDrawer.dart';

class PopupSectionWidget extends StatelessWidget {
  Icon mainIcon;
  String headingText, descText;

  PopupSectionWidget({
    Key? key,
    required this.headingText,
    required this.descText,
    required this.mainIcon,
  }) : super(key: key);

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
            mainIcon,
            SizedBox(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldHeadingRichText(headingText, 14, ""),
                  const SizedBox(
                    height: 5,
                  ),
                  FieldHeadingRichTextNormal(descText, "")
                ],
              ),
            ),
            Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5.0)), //<-- SEE HERE
                child: InkWell(
                  borderRadius: BorderRadius.circular(100.0),
                  onTap: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 300,
                            color: Colors.white70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 30, 30, 30),
                                  child: Center(
                                    child: FieldHeadingRichText(
                                        "Add properties", 18, ""),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: FieldHeadingRichTextNormal(
                                        "Properties show up underneath your item are clickable, and can be filtered in your collection's sidebar.",
                                        ""),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FieldHeadingRichText("Type", 16, ""),
                                    FieldHeadingRichText("Name", 16, ""),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.add,
                      size: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
