part of 'saatlik_satis_view.dart';

class MyDataSource extends DataTableSource {
  final List<SaatlikSatisModel> models;

  int? sortColumnIndex;
  bool sortAscending = true;

  MyDataSource(this.models);

  void sort<T>(int columnIndex,
      Comparable<T> Function(SaatlikSatisModel d) getField, bool ascending) {
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
    final SaatlikSatisModel model = models[index];
    return DataRow.byIndex(
      index: index,
      color: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return index % 2 == 0 ? Colors.grey.shade400 : null;
        },
      ),
      cells: [
        DataCell(Text('${index + 1}')),
        DataCell(Text('${model.tarih?.toFormatEdit}')),
        DataCell(Text('${model.saat}')),
        DataCell(Text(model.musSay.toString())),
        DataCell(Text('${model.sepetOrt}')),
        DataCell(Text('${model.ciro}')),
        DataCell(Text('${model.yemekKarti}')),
        DataCell(Text('${model.toplamSepet}')),
      ],
    );
  }

  @override
  int get rowCount => models.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
