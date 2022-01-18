import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ecommerce_website.dart';
import 'firebase_options.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const EcommerceWebsite());
}
