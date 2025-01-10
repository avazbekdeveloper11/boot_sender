import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  String? imei;
  int? batteryLevel;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _getIMEI();
    _getBatteryLevel();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.phone.request().isGranted && await Permission.notification.request().isGranted) {
      print("Permissions granted");
    } else {
      print("Permissions denied");
    }
  }

  Future<void> _getIMEI() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    setState(() {
      imei = androidInfo.id;
    });
  }

  Future<void> _getBatteryLevel() async {
    final battery = Battery();
    final level = await battery.batteryLevel;
    setState(() {
      batteryLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMEI & Battery Sender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('IMEI: $imei'),
            Text('Battery Level: $batteryLevel%'),
          ],
        ),
      ),
    );
  }
}
