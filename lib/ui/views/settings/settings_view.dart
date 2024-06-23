import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

const Map<String, String> _languageMap = {
  'en': 'English',
  'de': 'Deutsch',
  'bn': 'বাংলা',
};

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings_title'.tr()),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Theme(
            data: ThemeData(canvasColor: Colors.white),
            child: ListTile(
              title: Text('settings_language'.tr()),
              trailing: DropdownButton<Locale>(
                value: context.locale,
                onChanged: (v) => context.setLocale(v!),
                items: context.supportedLocales.map(
                  (language) {
                    return DropdownMenuItem(
                      value: language,
                      child: Text(_languageMap[language.languageCode]!),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
