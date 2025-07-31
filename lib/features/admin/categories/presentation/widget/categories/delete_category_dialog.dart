import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_event.dart';

Future<dynamic> deleteCategoryDiaglog(
  BuildContext context,
  int currentCategoryId,
  CategoriesBloc categoriesBloc,
) {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text(
            'Are You Sure You Want To Delete This Category ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: const Text(
            'This action cannot be undone.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          icon: const Icon(Icons.warning, size: 20, color: Colors.amberAccent),

          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    categoriesBloc.add(
                      DeleteCategoryEvent(id: currentCategoryId),
                    );
                    context.pop();
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
  );
}
