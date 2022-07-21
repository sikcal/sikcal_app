import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';


class MyCalender extends StatefulWidget {
  const MyCalender({Key? key}) : super(key: key);

  @override
  _MyCalender createState() => _MyCalender();
}

class _MyCalender extends State<MyCalender> {

  @override
  Widget build(BuildContext context) {
    bool issuccess = true;

    DateTime now = DateTime.now();

    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(now.year, now.month,     1),
      lastDay: DateTime(now.year, now.month + 1, 0),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: false,
        rightChevronVisible: false
      ),
      eventLoader: (day){
        if(issuccess == true) {
          return['mark'];
        }
        return[];

      },

    );
  }
}