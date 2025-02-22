import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_playground/constants/const_data.dart';

class SignInPage extends ConsumerWidget {
  SignInPage({super.key});

  final supabase = Supabase.instance.client;

  Future<AuthResponse> _googleSignIn() async {
    const webClientId = ConstData.gcpWebClientId;
    const androidClientId = ConstData.gcpAndroidClientId;

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: androidClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  try {
                    AuthResponse authResponse = await _googleSignIn();
                    if (authResponse.session != null) {
                      Navigator.pushNamed(context, '/home',
                          arguments: authResponse);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('로그인 세션이 없습니다.')),
                      );
                    }
                  } catch (error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('로그인 중 오류 발생 : $error')));
                  }
                },
                child: const Text('google sign in'))
          ],
        ),
      ),
    );
  }
}
