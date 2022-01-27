import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'core/config/di.dart' as di;
import 'features/presentation/widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.setUp();
  runApp(MyApp());
}