import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// widget
import 'package:mytodo/feature/bottommenu/view/calendar/widget/notecard_widget.dart';
import 'package:mytodo/feature/bottommenu/view/calendar/widget/notecreatebutton_widget.dart';

// constant
import 'package:mytodo/product/constants/color_constant.dart';

// base
import 'package:mytodo/product/utility/base/calendar_base/calendar_base.dart';

// pub dev
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends MainCalendarBase<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Takvim",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: ColorTextConstant.mainColor,
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            // table calendar widget
            buildTableCalendarWidget,
            // button
            buildNoteCreateBtnWidget,
            // note card
            buildNoteCardWidget,
          ],
        ),
      ),
    );
  }

  // table calendar widget
  Widget get buildTableCalendarWidget => TableCalendar(
        headerStyle: HeaderStyle(
            titleTextStyle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.titleMedium?.copyWith(
            color: ColorTextConstant.mainColor,
          ),
        )),
        calendarStyle: CalendarStyle(
          defaultTextStyle:
              const TextStyle(color: Colors.black), // Varsayılan metin rengi
          weekendTextStyle:
              const TextStyle(color: Colors.red), // Hafta sonu metin rengi
          // ...
          selectedDecoration: BoxDecoration(
            color: ColorBackgroundConstant.purplePrimary,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: const TextStyle(color: Colors.white),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(serviceModel.selectedDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            serviceModel.selectedDate = selectedDay;
            serviceModel.focusedDay = focusedDay;

            loadNoteForDate(selectedDay);
          });
        },
        firstDay: DateTime.utc(2000, 1, 1),
        lastDay: DateTime.utc(2100, 12, 31),
        focusedDay: serviceModel.focusedDay,
        calendarFormat: serviceModel.calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            serviceModel.calendarFormat = format;
          });
        },
      );

  // button
  Widget get buildNoteCreateBtnWidget => serviceModel.selectedNote.isEmpty
      ? NoteCreateButton(
          maxWidth: maxWidth,
          dynamicHeight: dynamicHeight,
          showNoteDialog: showNoteDialog,
        )
      : const SizedBox();
  // note card
  Widget get buildNoteCardWidget => NoteCard(
        maxWidth: maxWidth,
        serviceModel: serviceModel,
      );
}
