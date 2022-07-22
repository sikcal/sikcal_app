import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';


class MyCalender extends StatefulWidget {
  MyCalender({Key? key, required this.issuccess}) : super(key: key);

  List issuccess;

  @override
  _MyCalender createState() => _MyCalender();
}

class _MyCalender extends State<MyCalender> {

  @override
  Widget build(BuildContext context) {

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
      eventLoader: (day) {
        for (int i=0;i<widget.issuccess.length; i++) {
          if(day.day.toInt() == i+1) {
            return['mark'];
          }
          return[];
        }
        return [];
      }
    );
  }
}