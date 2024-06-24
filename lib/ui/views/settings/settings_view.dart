import 'package:brana/ui/common/ui_helpers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('settings_title'.tr()), centerTitle: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _LanguageSelection(),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'settings_theme'.tr(),
                style: theme.textTheme.bodyLarge,
              ),
              Transform(
                transform: Matrix4.identity()..scale(.8),
                child: CupertinoSwitch(
                  value: viewModel.isDarkMode,
                  onChanged: viewModel.toggleTheme,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) {
    return SettingsViewModel();
  }
}

class _LanguageSelection extends StatelessWidget {
  const _LanguageSelection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('settings_language'.tr()),
        Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: DropdownButton<Locale>(
            style: theme.textTheme.bodyLarge,
            value: context.locale,
            onChanged: (v) => context.setLocale(v!),
            items: context.supportedLocales.map(
              (language) {
                return DropdownMenuItem(
                  value: language,
                  child: Text(
                    _languageMap[language.languageCode]!,
                    style: theme.textTheme.bodyLarge,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
