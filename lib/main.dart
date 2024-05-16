import 'package:ah/core/local_noif.dart';
import 'package:ah/core/workmaager.dart';
import 'package:ah/feuters/add/data/add_model_adapter.dart';
import 'package:ah/feuters/add/data/modeladdd.dart';
import 'package:ah/feuters/home/prestion/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'generated/l10n.dart';
void main()async {
   WidgetsFlutterBinding.ensureInitialized(); 
   Hive.initFlutter();
  await Future.wait([
    LocalNotification.init(),
    WorkManagerService().init(),
  ]);
  Hive.registerAdapter(AddmodelAdapter());
  Hive.openBox<Addmodel>("alarim");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("ar"),
      localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
     
      home: const HomeScreeN(),
    );
  }
}