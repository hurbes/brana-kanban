import 'package:brana/ui/widgets/common/task_board_item/task_board_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'history_viewmodel.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistoryViewModel viewModel,
    Widget? child,
  ) {
    return ListView.builder(
      itemCount: viewModel.data?.length ?? 0,
      itemBuilder: (context, index) {
        return TaskBoardItem(
          onLongPress: (_) {},
          board: viewModel.data![index],
          onTap: viewModel.navigateToTaskBoard,
          headerColor: const Color(0xff1B1C1F),
        );
      },
    );
  }

  @override
  HistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistoryViewModel();
}
