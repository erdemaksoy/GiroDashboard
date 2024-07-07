import 'package:flutter/material.dart';

class MyDataSource extends DataTableSource {
  final List<dynamic> items;

  int? sortColumnIndex;
  bool sortAscending = true;
  MyDataSource(this.items);

  void sort<T>(int columnIndex,
      Comparable<T> Function(dynamic d) getField, bool ascending) {
    if (sortColumnIndex != null && sortColumnIndex == columnIndex) {
      ascending = !sortAscending;
    }
     items.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    sortColumnIndex = columnIndex;
    sortAscending = ascending;
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      color: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return index % 2 == 0 ? Colors.grey.shade400 : null;
        },
      ),
      cells: items.map((e) => DataCell(Text(e.toString()))).toList()
    );
  }

  @override
  int get rowCount => items.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}