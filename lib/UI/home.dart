// import 'dart:html';

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'menuDrawer.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

import 'package:iconsax/iconsax.dart';

import 'popupSections.dart';
import 'switchButtons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController loadingController;
  File? _file;
  PlatformFile? _platformFile;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }

  clearimage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  // Initial Selected Value
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  final List<String> itema = [
    'ETHERIUM',
    'BITCOIN',
    'CARDANO',
    'TRON',
  ];
  String? selectedValue;

  final nameCotroller = TextEditingController();
  final externalController = TextEditingController();
  final descriptionmyController = TextEditingController();
  final supplyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
            height: 46,
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          iconTheme: const IconThemeData(color: Colors.grey)),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
            height: 120,
            width: double.infinity,
            child: const Text(
              "Create New Item",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
            height: 120,
            width: double.infinity,
            child: RichText(
              text: const TextSpan(
                text: '* ',
                style: TextStyle(color: Colors.red),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Required Fields!',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 108, 107, 107)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            width: double.infinity,
            child: FieldHeadingRichText(
                'Image, Video, Audio, or 3d Model ', 18, "*"),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            width: double.infinity,
            child: FieldHeadingRichTextNormal(
                'Files types supported: JPG, PNG, GIF, SVG, MP4, WEBM, MP3, WAV, OGG, GLTF, Max sizeL 100MB',
                " "),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: selectFile,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        color: Colors.blue.shade400,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50.withOpacity(.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Iconsax.folder_open,
                                color: Colors.blue,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select your file',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
                _platformFile != null
                    ? Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selected File',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: const Offset(0, 1),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          _file!,
                                          width: 70,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _platformFile!.name,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${(_platformFile!.size / 1024).ceil()} KB',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey.shade500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 5,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.blue.shade50,
                                            ),
                                            child: LinearProgressIndicator(
                                              value: loadingController.value,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            FieldHeadingRichText("Name ", 14, "*"),
                            const SizedBox(
                              height: 10,
                            ),
                            FieldTextWidget("Item name ", nameCotroller),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FieldHeadingRichText("External Link ", 14, " "),
                            const SizedBox(
                              height: 5,
                            ),
                            FieldHeadingRichTextNormal(
                                "OpenSea will include external link to this URL on this item's detail page, so that the users can click to learn more about it. You're welcome to link to your own webpage with more details.",
                                " *"),
                            const SizedBox(
                              height: 5,
                            ),
                            FieldTextWidget("http://yoursite.io/item/123 ",
                                externalController),
                            const SizedBox(
                              height: 20,
                            ),
                            FieldHeadingRichText("Description ", 14, " "),
                            const SizedBox(
                              height: 5,
                            ),
                            FieldHeadingRichTextNormal(
                              "The disciption will be included on items detail page underneath its Image. Markdown syntax is supported",
                              " ",
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: descriptionmyController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor:
                                    const Color.fromARGB(255, 113, 113, 113),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey, //this has no effect
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: "Description",
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FieldHeadingRichText("Collection ", 14, " "),
                            const SizedBox(
                              height: 5,
                            ),
                            FieldHeadingRichTextNormal2(
                                "This is the collection where your item will appear ",
                                ""),
                            const SizedBox(
                              height: 5,
                            ),
                            customDropdown(),
                            const SizedBox(
                              height: 20,
                            ),
                            PopupSectionWidget(
                              headingText: "Properties",
                              descText: "Textual traits show up as rectangle",
                              mainIcon: const Icon(Icons.tune),
                            ),
                            PopupSectionWidget(
                              headingText: "Levels",
                              descText: "Numerical traits show up as progress",
                              mainIcon: const Icon(Icons.star),
                            ),
                            PopupSectionWidget(
                              headingText: "Stats",
                              descText: "Numerical traits show up as numbers",
                              mainIcon: const Icon(Icons.bar_chart_sharp),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SwitchButtonSections(
                                titleText: "Unlockable Content",
                                descText:
                                    "Include unlockable content that can only be revealed by the owner of the item.",
                                iconsData:
                                    const Icon(Icons.lock_clock_outlined),
                                widgetName: const SwitchButtonOne()),
                            const SizedBox(
                              height: 25,
                            ),
                            SwitchButtonSections(
                              titleText: "Explicit & Sensitive Content",
                              descText:
                                  "Set this item as Explicit & sensitive content.",
                              iconsData: const Icon(Icons.warning),
                              widgetName: const SwitchButton(),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            // SwitchButtonOne(),
                            FieldHeadingRichText("Supply", 14, ""),
                            const SizedBox(height: 5),
                            FieldHeadingRichTextNormal2(
                                "The number of items that can be minted. No gas cost to you ",
                                ""),
                            const SizedBox(
                              height: 10,
                            ),
                            FieldTextWidget("1", supplyController),
                            const SizedBox(
                              height: 25,
                            ),
                            FieldHeadingRichText("Blockchain", 14, ""),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              width: double.infinity,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: itema
                                      .map((itema) => DropdownMenuItem<String>(
                                            value: itema,
                                            child: Text(
                                              itema,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  },
                                  buttonHeight: 40,
                                  buttonWidth: 140,
                                  itemHeight: 40,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FieldHeadingRichText("Freeze Metadata", 14, ""),
                            const SizedBox(
                              height: 5,
                            ),
                            FieldHeadingRichTextNormal2(
                                "Freezing your metadata will allow you to permanently and store all of this item's content in decentralized file storage. ",
                                ""),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        152, 187, 222, 251),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.blueGrey.shade300)),
                                child: const Text(
                                  "To freeze metadata, you must create your item first.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              height: 45,
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor: Colors.blue),
                                onPressed: () {
                                  print(
                                      "Data \n$_file\n${nameCotroller.text}\n${externalController.text}\n${descriptionmyController.text}\n${supplyController.text}\n$dropdownvalue\n$selectedValue\n $isSwitched\n $textValue\n $isSwitchedOne\n $textValueOne");
                                },
                                child: const Text(
                                  'Create',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            )
                          ],
                        ))
                    : Container(),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      )),
      drawer: const MenuDrawer(),
    );
  }

  DropdownButtonFormField<String> customDropdown() {
    return DropdownButtonFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
        ),
        iconSize: 32,
        borderRadius: BorderRadius.circular(5.0),
        icon: const Icon(Icons.arrow_drop_down_sharp),
        hint: const Text("Select collection"),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        });
  }
}
