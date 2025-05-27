import 'package:flutter/material.dart';
import 'package:project_asli/view/home_view.dart';
import 'package:project_asli/view/auth/login_view.dart';
import 'package:project_asli/view/profile/profile_view.dart';
import 'package:project_asli/view/auth/register_view.dart';
import 'package:project_asli/view/splash_screen.dart';
import 'package:project_asli/view/chat/chat_list_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.brown,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
          accentColor: Color.fromARGB(77, 81, 79, 79),
        ),
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginView(),
        '/register': (context) => RegisterView(), 
        '/home': (context) => HomeView(),
        '/profile': (context) => ProfileView(),
        '/chat': (context) => ChatListView(),
      },
    );
  }
}
