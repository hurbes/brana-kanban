import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'brana_form_model.dart';

class BranaForm extends StackedView<BranaFormModel> {
  const BranaForm({super.key});

  @override
  Widget builder(
    BuildContext context,
    BranaFormModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  BranaFormModel viewModelBuilder(
    BuildContext context,
  ) =>
      BranaFormModel();
}
