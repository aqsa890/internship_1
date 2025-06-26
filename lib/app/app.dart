import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_constants.dart';
import '../features/auth/viewmodels/auth_viewmodel.dart';
import '../features/auth/views/login_screen.dart';
import '../features/auth/views/splash_screen.dart';
import '../features/tasks/viewmodels/task_viewmodel.dart';
import '../features/tasks/views/home_screen.dart';
import '../features/tasks/views/add_task_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          AppConstants.loginRoute: (context) => const LoginScreen(),
          AppConstants.homeRoute: (context) => const HomeScreen(),
          AppConstants.addTaskRoute: (context) => const AddTaskScreen(),
        },
      ),
    );
  }
}
