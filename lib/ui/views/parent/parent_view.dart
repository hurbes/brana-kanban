import 'package:animations/animations.dart';
import 'package:brana/ui/common/ui_helpers.dart';
import 'package:brana/ui/views/history/history_view.dart';
import 'package:brana/ui/views/home/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'parent_viewmodel.dart';

class ParentView extends StackedView<ParentViewModel> {
  const ParentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ParentViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const _ParentAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: [
          BottomNavigationBarItem(
            label: 'tasks'.tr(),
            icon: const Icon(CupertinoIcons.table_badge_more),
          ),
          BottomNavigationBarItem(
            label: 'history'.tr(),
            icon: const Icon(CupertinoIcons.time),
          ),
        ],
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: viewModel.reverse,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: getViewForIndex(viewModel.currentIndex),
      ),
    );
  }

  @override
  ParentViewModel viewModelBuilder(BuildContext context) => ParentViewModel();

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const HistoryView();
      default:
        return const HomeView();
    }
  }
}

class _ParentAppBar extends ViewModelWidget<ParentViewModel>
    implements PreferredSizeWidget {
  const _ParentAppBar();

  @override
  Size get preferredSize => const Size(double.infinity, 65);

  @override
  Widget build(BuildContext context, ParentViewModel viewModel) {
    final theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: viewModel.navigateToSettings,
          icon: const Icon(Icons.settings),
        ),
      ],
      title: ListTile(
        title: Text(
          viewModel.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.headlineMedium,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
          child: SizedBox(
            width: screenWidthFraction(context, dividedBy: 2),
            child: Text(
              viewModel.subtitle,
              maxLines: 1,
              style: theme.textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }
}
