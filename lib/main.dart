import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phone_data_sender/src/core/services/notification_service.dart';

import 'src/app.dart';
import 'src/injector_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initialize();
  await init();

  runApp(const MainApp());
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply
