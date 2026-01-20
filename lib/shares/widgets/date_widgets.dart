import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:ecert/assets/assets.src.dart';
import 'package:ecert/cores/theme/theme.src.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateWidget {
  static Future<List<DateTime?>?> changeDatePicker({
    required Widget okButton,
    required Widget cancelButton,
    required List<DateTime?> value,
    CalendarDatePicker2Type type = CalendarDatePicker2Type.range,
  }) async {
    List<DateTime?>? values = await showCalendarDatePicker2Dialog(
      config: CalendarDatePicker2WithActionButtonsConfig(
        okButton: okButton,
        cancelButton: cancelButton,
        firstDayOfWeek: 1,
        calendarType: type,
        selectedDayTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        selectedDayHighlightColor: AppColors.colorIconDoc,
        centerAlignModePicker: false,
        // customModePickerIcon: SizedBox(),
        weekdayLabels: AppStr.listWeekdayLabels,
      ),
      value: value,
      context: Get.context!,
      dialogSize: Size(Get.width - 50, Get.height / 2),
    );
    return values;
  }
}
