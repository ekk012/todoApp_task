import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/screens/auth/auth_page.dart';
import 'package:task_app/screens/home_page.dart';
import 'package:task_app/screens/auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_app/services/firebase_auth_methods.dart';
import 'package:task_app/services/todo_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: ((context) => context.read<FirebaseAuthMethods>().authState),
          initialData: null,
        ),
        ChangeNotifierProvider<TodoService>(
          create: (context) {
            return TodoService();
          },
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return HomePage();
    }
    return const AuthPage();

  }
}
