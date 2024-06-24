import 'package:brana/ui/common/ui_helpers.dart';
import 'package:brana/ui/widgets/common/task_board_item/task_board_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  bool get disposeViewModel => false;

  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return SkeletonLoader(
      loading: viewModel.isBusy,
      child: const _TaskBoardList(),
    );
  }
}

class _TaskBoardList extends ViewModelWidget<HomeViewModel> {
  const _TaskBoardList();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);

    if (!viewModel.isBusy && viewModel.data?.isEmpty == true) {
      return ListView(
        children: [
          verticalSpaceLarge,
          Center(
            child: Text(
              'create_todo_list'.tr(),
              style: theme.textTheme.titleLarge,
            ),
          ),
          Center(child: Image.asset('assets/home/empty_home.png')),
          const _AddTaskBoardFAB()
        ],
      );
    }
    return ListView.builder(
      itemCount: viewModel.taskBoardCount + 1,
      key: const PageStorageKey('home_list_key'),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      itemBuilder: (context, index) {
        if (index == viewModel.taskBoardCount) {
          return const _AddTaskBoardFAB();
        }
        return TaskBoardItem(
          headerColor: theme.primaryColor,
          board: viewModel.data![index],
          onTap: viewModel.navigateToTaskBoard,
          onLongPress: viewModel.longPressTaskBoard,
        );
      },
    );
  }
}

class _AddTaskBoardFAB extends ViewModelWidget<HomeViewModel> {
  const _AddTaskBoardFAB();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, top: 16),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: viewModel.addTaskBoard,
          backgroundColor: theme.primaryColor,
          child: Icon(Icons.add, color: theme.primaryColorLight),
        ),
      ),
    );
  }
}
