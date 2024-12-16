import 'package:flutter/material.dart';

String getDeviceLocale() {
  return WidgetsBinding.instance.platformDispatcher.views.first
      .platformDispatcher.locale.languageCode;
}
