part of "stok_hareket_view.dart";

class MyDataSource extends DataTableSource {
  final List<StokHareketModel> data;

  int? sortColumnIndex;
  bool sortAscending = true;

  MyDataSource(this.data);

  void sort<T>(int columnIndex,
      Comparable<T> Function(StokHareketModel d) getField, bool ascending) {
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
    final StokHareketModel item = data[index];
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
        DataCell(Text('${item.tarih.toFormatEdit}')),
        DataCell(Text(item.belgeNo ?? "")),
        DataCell(Text('${item.evrakNo}')),
        DataCell(Text('${item.belgeTipi}')),
        DataCell(Text('${item.belgeAdi}')),
        DataCell(Text('${item.girenMiktar}')),
        DataCell(Text('${item.cikanMiktar}')),
        DataCell(Text('${item.harBakiye}')),
        DataCell(Text('${item.cariAdi}')),
        DataCell(Text('${item.stokNF}')),
        DataCell(Text('${item.netTutar}')),
        DataCell(Text('${item.stokBF}')),
        DataCell(Text('${item.kdvOrani}')),
        DataCell(Text('${item.stokHr_Recno}')),
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
