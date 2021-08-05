import 'package:flutter/material.dart';

class CreateLeaveScreen extends StatefulWidget {
  const CreateLeaveScreen({Key? key}) : super(key: key);

  @override
  _CreateLeaveScreenState createState() => _CreateLeaveScreenState();
}

class _CreateLeaveScreenState extends State<CreateLeaveScreen> {
  DateTime? startDate;
  DateTime? endDate;
  int _value = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(
          color: Color(0xFF4B53F5),
        ),
        title: Text(
          'Create leave plan',
          style: TextStyle(fontSize: 21, color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                print(_getTypeLeave);
                print(_getStartDate);
                print(_getEndDate);
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 16, color: Color(0xFF4B53F5)),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Container(
          child: Column(children: [
            DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text('Vacation'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('Sick / Medical Appoinment'),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text('Maternity'),
                  value: 3,
                ),
              ],
              onChanged: (int? value) {
                setState(() {
                  _value = value!;
                });
              },
              icon: Icon(Icons.keyboard_arrow_down_sharp),
              iconEnabledColor: Color(0xFF4B53F5),
              iconDisabledColor: Color(0xFF4B53F5),
              isExpanded: true,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 157,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _getStartDate,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.9)),
                          ),
                          IconButton(
                            onPressed: () {
                              _pickDate(context);
                            },
                            icon: Icon(
                              Icons.date_range,
                              color: Color(0xFF4B53F5),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 5,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 157,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _getEndDate,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.9)),
                          ),
                          IconButton(
                            onPressed: () {
                              _pickDate(context, startDateSelect: false);
                            },
                            icon: Icon(
                              Icons.date_range,
                              color: Color(0xFF4B53F5),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 5,
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  Future _pickDate(BuildContext context, {bool startDateSelect = true}) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => startDateSelect ? startDate = newDate : endDate = newDate);

    return startDateSelect ? startDate : endDate;
  }

  String get _getStartDate => (startDate == null)
      ? 'Start'
      : '${startDate!.year}/${startDate!.month}/${startDate!.day}';

  String get _getEndDate => (endDate == null)
      ? 'End'
      : '${endDate!.year}/${endDate!.month}/${endDate!.day}';

  String get _getTypeLeave => (_value == 1)
      ? 'Vacation'
      : (_value == 2)
      ? 'Sick / Medical Appoinment'
      : (_value == 3)
      ? 'Maternity'
      : '';
}
