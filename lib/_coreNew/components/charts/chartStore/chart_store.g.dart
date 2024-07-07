// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChartStore on _ChartStoreBase, Store {
  late final _$modelsAtom =
      Atom(name: '_ChartStoreBase.models', context: context);

  @override
  List<DashboardModel?> get models {
    _$modelsAtom.reportRead();
    return super.models;
  }

  @override
  set models(List<DashboardModel?> value) {
    _$modelsAtom.reportWrite(value, super.models, () {
      super.models = value;
    });
  }

  late final _$touchedIndexAtom =
      Atom(name: '_ChartStoreBase.touchedIndex', context: context);

  @override
  int get touchedIndex {
    _$touchedIndexAtom.reportRead();
    return super.touchedIndex;
  }

  @override
  set touchedIndex(int value) {
    _$touchedIndexAtom.reportWrite(value, super.touchedIndex, () {
      super.touchedIndex = value;
    });
  }

  late final _$_ChartStoreBaseActionController =
      ActionController(name: '_ChartStoreBase', context: context);

  @override
  void setTouchedIndex(int index) {
    final _$actionInfo = _$_ChartStoreBaseActionController.startAction(
        name: '_ChartStoreBase.setTouchedIndex');
    try {
      return super.setTouchedIndex(index);
    } finally {
      _$_ChartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModels(List<DashboardModel?> newModels) {
    final _$actionInfo = _$_ChartStoreBaseActionController.startAction(
        name: '_ChartStoreBase.setModels');
    try {
      return super.setModels(newModels);
    } finally {
      _$_ChartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
models: ${models},
touchedIndex: ${touchedIndex}
    ''';
  }
}
