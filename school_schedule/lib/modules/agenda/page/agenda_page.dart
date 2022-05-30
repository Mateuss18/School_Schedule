import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:school_schedule_debug_version/core/app_colors.dart';
import 'package:school_schedule_debug_version/core/app_images.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    double heigthValue = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text('Agenda'),
          backgroundColor: Colors.white),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: heigthValue * 0.35,
                decoration: const BoxDecoration(
                    color: AppColors.corPrimaria,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: TableCalendar(
                  shouldFillViewport: true,
                  headerStyle: const HeaderStyle(
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Colors.white),
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle:
                          TextStyle(fontSize: 18, color: Colors.white)),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    decoration: BoxDecoration(),
                    weekdayStyle: TextStyle(color: Colors.white),
                    weekendStyle: TextStyle(color: Colors.white),
                  ),
                  rowHeight: 35,
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    todayTextStyle: TextStyle(color: AppColors.corPrimaria),
                    rangeHighlightColor: Colors.red,
                    weekendTextStyle: TextStyle(color: Colors.white60),
                    defaultTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
              ),
              card(),
              card(),
              card(),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.adicionar)),
              ],
            )
          ],
        )
      ]),
    );
  }

  Widget card() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(AppImages.iconProvasAzulBrancoSVG),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lab Eng Software'),
                  Text('Prova 1'),
                  Text(
                    'Data de entrega ${DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()}',
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              )
            ],
          ),
          Divider(
            height: 1,
            color: Color.fromARGB(255, 74, 74, 74),
          ),
        ],
      ),
    );
  }
}
