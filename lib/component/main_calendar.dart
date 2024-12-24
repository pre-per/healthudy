import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/provider/attendanceProvider.dart';
import 'package:healthudy/provider/selectedDateProvider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<SelectedDateProvider>(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: MAIN_WHITE_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: TableCalendar(
          locale: 'ko_kr',
          focusedDay: DateTime.now(),
          firstDay: DateTime(2000, 1, 1),
          lastDay: DateTime(2100, 1, 1),
          selectedDayPredicate: (day) {
            return isSameDay(dateProvider.selectedDate, day);
          },
          onDaySelected: (selectedDay, focusDay) {
            dateProvider.selectDate(selectedDay);
          },
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: PRIMARY_COLOR,
            ),
            defaultDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: LIGHT_GREY_COLOR,
            ),
            weekendDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: LIGHT_GREY_COLOR,
            ),
            selectedDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: LIGHT_GREY_COLOR,
              border: Border.all(
                color: PRIMARY_COLOR,
                width: 2.0,
              ),
            ),
            todayTextStyle: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
            selectedTextStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: PRIMARY_COLOR,
            ),
          ),
          /* calendarBuilders:
              CalendarBuilders(defaultBuilder: (context, day, focusedDay) {
            if () {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.115,
                  height: MediaQuery.of(context).size.height * 0.0425,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: PASTEL_GREEN_COLOR,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            }
            return null;
          }), */
        ), 
      ),
    );
  }
}
