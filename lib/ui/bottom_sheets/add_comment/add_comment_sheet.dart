import 'package:brana/ui/bottom_sheets/add_comment/add_comment_sheet.form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_localization/easy_localization.dart';

import 'add_comment_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'comment'),
])
class AddCommentSheet extends StackedView<AddCommentSheetModel>
    with $AddCommentSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddCommentSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddCommentSheetModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Container(
      height: 450,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      completer!(SheetResponse(confirmed: true));
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      color: theme.primaryColorLight,
                    ),
                  ),
                  Text(
                    'comments'.tr(),
                    style: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final comment = viewModel.data![index];
                    return ListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      title: Text(
                        comment.comment,
                        style: theme.textTheme.headlineSmall,
                      ),
                      subtitle: Text(
                        viewModel.getCommentDate(comment.createdAt!),
                        style: theme.textTheme.labelSmall,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: commentController,
                  style: TextStyle(
                    color: theme.primaryColorLight,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'add_comment_hint'.tr(),
                    hintStyle: TextStyle(
                      color: theme.primaryColorLight.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        await viewModel.addComment();
                        commentController.clear();
                      },
                      child: Icon(
                        Icons.send_rounded,
                        color: viewModel.enableSubmit
                            ? theme.primaryColor
                            : theme.primaryColorLight,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  @override
  void onViewModelReady(AddCommentSheetModel viewModel) {
    syncFormWithViewModel(viewModel);

    super.onViewModelReady(viewModel);
  }

  @override
  AddCommentSheetModel viewModelBuilder(BuildContext context) {
    return AddCommentSheetModel(request.data!);
  }
}
