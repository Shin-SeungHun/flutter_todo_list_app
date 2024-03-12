import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/data/model/todo_model.dart';
import 'package:flutter_todo_list_app/di/di_set_up.dart';
import 'package:flutter_todo_list_app/router/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

Future<void> init()async{
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await diSetup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.indigo),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
