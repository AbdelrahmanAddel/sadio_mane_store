import 'package:flutter/material.dart';
import 'package:sadio_mane_store/generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get tr => S.of(this);
}
