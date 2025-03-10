import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_playground/pages/home_page.dart';
import 'package:supabase_playground/pages/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const supabaseUrl = "https://xkjqeouyytxoscrdgdwk.supabase.co";
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/sign_in',
      routes: {
        '/sign_in': (context) => SignInPage(),
        '/home': (context) => HomePage(
            authResponse:
                ModalRoute.of(context)!.settings.arguments as AuthResponse),
      },

      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Supabase 테스트'),
      //   ),
      //   body: const Center(
      //     child: Text('supabase 연결 성공 !'),
      //   ),
      // ),
    );
  }
}
