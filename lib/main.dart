import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

   EasyLoading.init();

  runApp(const App());
}

