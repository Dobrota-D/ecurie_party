import 'package:ecurie_party/Pages/profil.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'actualites.dart';
import 'add_event_page.dart';

// stateful widget created for calendar class
class calendrier extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<calendrier> {
  Color _colorFond = const Color(0xFFFFF3E0);
  Color _colorButton = const Color(0xFF730800);
  Color _colorBottumNavBar = const Color(0xFF8D6E63);

  CalendarController _calendarController = new CalendarController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: _colorFond,
          ),
        ),
        Scaffold(
          appBar: AppBar(
              backgroundColor: _colorButton,
              centerTitle: true,
              title: Text('Calendrier')),
          bottomNavigationBar: BottomAppBar(
            color: _colorFond,

            // <-- APPBAR WITH TRANSPARENT BG
            elevation: 0,

            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.article,
                    size: 40,
                    color: _colorBottumNavBar,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => actualites()));
                    // do something
                  },
                ),
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.add,
                    size: 40,
                    color: _colorBottumNavBar,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => add_event_page()));
                    // do something
                  },
                ),

                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.calendar_month,
                    size: 40,
                    color: _colorBottumNavBar,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => calendrier()));
                    // do something
                  },
                ),
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.face,
                    color: _colorBottumNavBar,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => profil()));
                    // do something
                  },
                ),
                // IconButton(icon: Icon(Icons.search), onPressed: () {},),
              ],
            ),
          ),
          body: Center(
            // create calendar
            child: TableCalendar(
              calendarController: _calendarController,
            ),
          ),
        ),
      ],
    );
  }
}
