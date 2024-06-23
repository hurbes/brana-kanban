import 'package:brana/ui/bottom_sheets/add_comment/add_comment_sheet.form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

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
    return Container(
      height: 450,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
                      color: Colors.grey[600],
                    ),
                  ),
                  const Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
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
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      subtitle: Text(
                        viewModel.getCommentDate(comment.createdAt!),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: commentController,
                  focusNode: commentFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Add a comment',
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        await viewModel.addComment();
                        commentController.clear();
                      },
                      child: Icon(
                        Icons.send_rounded,
                        color: viewModel.enableSubmit
                            ? const Color(0xFF00A3FF)
                            : Colors.grey,
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
