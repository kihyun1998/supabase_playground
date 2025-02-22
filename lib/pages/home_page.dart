// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
    required this.authResponse,
  });

  final AuthResponse authResponse;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late String userId;
  late String userName;

  @override
  void initState() {
    super.initState();
    userId = widget.authResponse.user?.id ?? 'no id';
    userName = widget.authResponse.user?.userMetadata?['name'] ?? 'no username';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("id: $userId"),
            Text('name: $userName'),
          ],
        ),
      ),
    );
  }
}
