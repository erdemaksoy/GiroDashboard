part of 'kasiyer_performans_view.dart';

class MyDataSource extends DataTableSource {
  final List<KasiyerPerformansModel> data;

  int? sortColumnIndex;
  bool sortAscending = true;

  MyDataSource(this.data);

  void sort<T>(
      int columnIndex,
      Comparable<T> Function(KasiyerPerformansModel d) getField,
      bool ascending) {
    if (sortColumnIndex != null && sortColumnIndex == columnIndex) {
      ascending = !sortAscending;
    }
    data.sort((a, b) {
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
    final KasiyerPerformansModel item = data[index];
    return DataRow.byIndex(
      index: index,
      color: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return index % 2 == 0 ? Colors.grey.shade400 : null;
        },
      ),
      cells: [
        DataCell(Text('${index + 1}')),
        DataCell(Text('${item.subeKodu}')),
        DataCell(Text('${item.subeAdi}')),
        DataCell(Text('${item.kasiyer}')),
        DataCell(Text('${item.adSoyad}')),
        DataCell(Text('${item.stokAd}')),
        DataCell(Text('${item.satisMiktar}')),
        DataCell(Text('${item.satisTutar}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
