import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schatty/core/app.dart';
import 'package:schatty/core/shared_preferences/schatty_sp.dart';
import 'package:schatty/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SchattySP().init();

  runApp(const ProviderScope(child: App()));
}
