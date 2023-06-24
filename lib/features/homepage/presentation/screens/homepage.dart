import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schatty/config/global_constants.dart';
import 'package:schatty/config/theme/providers.dart';
import 'package:schatty/features/auth/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static String get routeName => 'home';
  static String get routeLocation => '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(GlobalConstants.appName),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer(
            builder: (context, ref, _) {
              final authState = ref.watch(authProvider);
              return Text(
                'Welcome Back ${authState.asData?.value?.displayName}',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              );
            },
          ),
          Switch(
            value: ref.watch(themeProvider) == ThemeMode.dark,
            onChanged: (_) => ref.read(themeProvider.notifier).toggle(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: FirebaseAuth.instance.signOut,
        child: const Icon(Icons.logout),
      ),
    );
  }
}
