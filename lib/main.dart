import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/dropdown_menu.dart';
import 'models/sumit_button.dart';
import 'models/text_filed.dart';
import 'models/toggle_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: FeedbackScreen(),
    );
  }
}

// enum SingingCharacter { lafayette, jefferson }

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String _controller = '';
  final List<bool> _selected = <bool>[true, false];
  final List<String> _classList = <String>['One', 'Two', 'Three', 'Four'];
  final List<String> _batchList = <String>[
    '4-5 PM',
    '5-6 PM',
    '6-7 PM',
    '7-8 PM'
  ];
  final List<String> _reasonList = <String>[
    'App is Buggy',
    'Result is Late',
    'Others Problems'
  ];
  String? _classDropDownValue = null;
  String? _batchDropDownValue = null;
  String? _reasonDropDownValue = null;

  String _problemController = '';
  bool _validate = false;
  String emptyText = 'Value can not be Empty';
  String labelText = '';
  String hintText = 'Describe Your Problem ........';
  Color color = Colors.red;

  // @override
  // void dispose() {
  //   _text.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f3f7),
      appBar: AppBar(
        title: const Text('FeedBack'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 10),
        color: const Color(0xFFf2f3f7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFiled(
              onTap: () {
                setState(() {
                  emptyText = 'Enter Your Name';
                  color = Colors.deepPurple;
                  print('$labelText    ...........');
                });
              },
              onChanged: (value) {
                setState(() {
                  _controller = value;
                  print('controller ${_controller.toString()}');
                });
              },
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              maxLines: 1,
              labelText: _validate ? emptyText : 'Enter Your Name',
              minLines: 1,
              height: 60,
              errorText: '',
              color: _validate ? color : Colors.deepPurple,
            ),
            ToggleButton(
              selected: _selected,
              onPressed: (value) {
                setState(() {
                  for (int i = 0; i < _selected.length; i++) {
                    _selected[i] = i == value;
                  }
                  // for (int i = 0; i < _selected.length; i++) {
                  //   if (i == value) {
                  //     _selected[i] = true;
                  //   } else {
                  //     _selected[i] = false;
                  //   }
                  // }
                });

                if (value == 0) {
                  print('Student');
                } else if (value == 1) {
                  print('Parent');
                } else {
                  print('Nothing');
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: DropDownMenu(
                    text: 'Your Class',
                    dropDownList: _classList,
                    dropdownValue: _classDropDownValue,
                    onChanged: (value) {
                      setState(() {
                        _classDropDownValue = value;
                        print(_classDropDownValue);
                      });
                    },
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: DropDownMenu(
                      text: 'Your Batch',
                      dropDownList: _batchList,
                      onChanged: (value) {
                        setState(() {
                          _batchDropDownValue = value;
                          print(_batchDropDownValue);
                        });
                      },
                      dropdownValue: _batchDropDownValue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: DropDownMenu(
                text: 'Your Reason',
                dropDownList: _reasonList,
                onChanged: (value) {
                  setState(() {
                    _reasonDropDownValue = value;
                    print(_reasonDropDownValue);
                  });
                },
                dropdownValue: _reasonDropDownValue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextFiled(
                height: double.infinity,
                maxLines: null,
                onChanged: (value) {
                  _problemController = value;
                  print(_problemController);
                },
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: labelText,
                hintText: hintText,
                isExpand: true,
                isCollapsed: true,
                topContentPadding: 20,
                errorText: '',
                onTap: () {
                  setState(() {
                    labelText = 'Describe Your Problem';
                    hintText = '';
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SummitButton(
              onTap: () async {
                setState(() {
                  _controller.isEmpty ? _validate = true : _validate = false;
                  print('$_controller aaaaaaa');

                  // Alert(
                  //   context: context,
                  //   type: AlertType.success,
                  //   title: "Thanks For Feedback",
                  //   // desc: "Flutter is more awesome with RFlutter Alert.",
                  //   buttons: [
                  //     DialogButton(
                  //       onPressed: () => Navigator.pop(context),
                  //       width: 120,
                  //       child: const Text(
                  //         "HomePage",
                  //         style: TextStyle(color: Colors.white, fontSize: 20),
                  //       ),
                  //     )
                  //   ],
                  // ).show();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
