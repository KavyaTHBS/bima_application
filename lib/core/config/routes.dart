import 'package:bima_application/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> applicationRoutes() {
  return <String, WidgetBuilder>{'login': (_) => LoginPage()};
}
