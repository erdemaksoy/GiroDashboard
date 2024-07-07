part of "gimsa_satis_view.dart";

class MyDataSource extends DataTableSource {
  final List<GimsaSatisModel> models;
  int? sortColumnIndex;
  bool sortAscending = true;

  MyDataSource(this.models);

  void sort<T>(int columnIndex,
      Comparable<T> Function(GimsaSatisModel d) getField, bool ascending) {
    if (sortColumnIndex != null && sortColumnIndex == columnIndex) {
      ascending = !sortAscending;
    }
    models.sort((a, b) {
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
    final GimsaSatisModel item = models[index];
    return DataRow.byIndex(
      index: index,
      color: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return index % 2 == 0 ? Colors.grey.shade400 : null;
        },
      ),
      cells: [
        DataCell(Text('${item.stokNo}')),
        DataCell(Text('${item.urunKodu}')),
        DataCell(Text('${item.barkod}')),
        DataCell(Text('${item.urunAdi}')),
        DataCell(Text('${item.kdvHaricMal}')),
        DataCell(Text('${item.satisFiyati}')),
        DataCell(Text('${item.kdv}')),
        DataCell(Text('${item.mevcut}')),
        DataCell(Text('${item.brm}')),
        DataCell(Text('${item.y2023}')),
        DataCell(Text('${item.y2022}')),
        DataCell(Text('${item.y2021}')),
        DataCell(Text('${item.y2020}')),
        DataCell(Text('${item.giris2023}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => models.length;

  @override
  int get selectedRowCount => 0;
}
