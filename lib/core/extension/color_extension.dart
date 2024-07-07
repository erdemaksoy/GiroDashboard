import 'dart:math';

import 'package:flutter/material.dart';

extension RandomColor on Color? {
  Color get toRandomColor => Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
