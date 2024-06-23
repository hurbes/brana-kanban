import 'package:brana/ui/common/ui_helpers.dart';
import 'package:brana/ui/widgets/brana_app_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'intro_viewmodel.dart';

class IntroView extends StackedView<IntroViewModel> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IntroViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/start_up/1.png'),
          verticalSpaceLarge,
          AppButton(
            title: 'Start',
            height: 45,
            borderRadius: 16,
            width: screenWidthFraction(context, dividedBy: 1, offsetBy: 80),
            onPressed: viewModel.setStartUpCheck,
          )
        ],
      ),
    );
  }

  @override
  IntroViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IntroViewModel();
}
