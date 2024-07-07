import 'package:flutter/material.dart';

import 'data_table_source.dart';

class MyPaginatedDataTable extends StatelessWidget {
  const MyPaginatedDataTable({super.key,required this.dataSource,required this.columns});
   final MyDataSource dataSource;
   final List<DataColumn>columns;
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
        rowsPerPage: 8,
        columns: columns,
      source: dataSource,
      sortColumnIndex: dataSource.sortColumnIndex,
      sortAscending: dataSource.sortAscending,
    );
  }
}