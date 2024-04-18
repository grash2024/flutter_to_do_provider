import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/pages/task_page.dart';
import 'package:todo_provider/task_operation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskOperation(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff22092C),
            primary: const Color(0xff22092C),
            secondary: const Color(0xffBE3144),
            tertiary: const Color(0xffF05941),
          ),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Color(0xffBE3144),
                fontSize: 32,
                fontWeight: FontWeight.bold),
            bodySmall: TextStyle(
                color: Color(0xffffF05941),
                fontSize: 16,
                fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                color: Color(0xffF05941),
                fontSize: 32,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
                color: Color(0xff22092C),
                fontSize: 24,
                fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                color: Color(0xff22092C),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        home: const TaskPage(),
      ),
    );
  }
}
