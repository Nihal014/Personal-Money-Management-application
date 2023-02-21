import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/category/category_model.dart';
import 'package:flutter_application_1/screens/add_transaction_page.dart';
import 'package:flutter_application_1/screens/home/screenHome.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(categoryTypeAdapter().typeId)) {
    Hive.registerAdapter(categoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(categoryModelAdapter().typeId)) {
    Hive.registerAdapter(categoryModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: screenHome(),
      routes: {
        screenaddtransactionpage.routeName:(ctc) =>const screenaddtransactionpage(), 
      },
    );
  }
}
//hehe comment added