import 'package:brana/ui/common/ui_helpers.dart';
import 'package:brana/ui/widgets/brana_app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_localization/easy_localization.dart';

import 'date_picker_sheet_model.dart';

class DatePickerSheet extends StackedView<DatePickerSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DatePickerSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DatePickerSheetModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Container(
      height: 415,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: viewModel.close,
              icon: Icon(Icons.close, size: 30, color: theme.primaryColorLight),
            ),
          ),
          SizedBox(
            height: 300,
            width: screenWidth(context),
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    color: theme.primaryColorLight,
                    fontSize: 20,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                backgroundColor: theme.cardColor,
                minimumDate: DateTime.now(),
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: viewModel.onDateChanged,
              ),
            ),
          ),
          AppButton(
            height: 45,
            title: 'save'.tr(),
            onPressed: viewModel.save,
            enabled: viewModel.hasSelectedDate,
            width: screenWidthFraction(context, dividedBy: 1, offsetBy: 80),
          )
        ],
      ),
    );
  }

  @override
  DatePickerSheetModel viewModelBuilder(BuildContext context) {
    return DatePickerSheetModel();
  }
}
