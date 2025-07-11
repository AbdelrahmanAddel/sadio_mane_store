import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/users/presentation/widgets/custom_table_size_cell_title.dart';

class UsersViewTable extends StatelessWidget {
  const UsersViewTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: context.theme.appColors.bluePinkLight),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: const FlexColumnWidth(),
        1: const FlexColumnWidth(),
        2: FixedColumnWidth(80.w),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: context.theme.appColors.bluePinkDark,
          ),
          children: [
            _usersViewTitleTableCell(title: 'Name', icon: Icons.person),
            _usersViewTitleTableCell(title: 'Email', icon: Icons.email),
            _usersViewTitleTableCell(
              title: 'Delete',
              icon: Icons.delete,
              padding: 1,
            ),
          ],
        ),
        ...List.generate(100, (index) {
          return TableRow(
            children: [
              _usersViewContentTableCell(title: 'AbdelrahmanEzz'),
              _usersViewContentTableCell(title: 'AbdelrahmanEzze@gmail.com'),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  TableCell _usersViewTitleTableCell({
    required String title,
    required IconData icon,
    double? padding,
  }) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,

      child: Padding(
        padding: EdgeInsets.all(padding ?? 10),
        child: CustomTableSizeCellTitle(icon: icon, title: title),
      ),
    );
  }

  TableCell _usersViewContentTableCell({
    required String title,
    double? padding,
  }) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 5),
        child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
