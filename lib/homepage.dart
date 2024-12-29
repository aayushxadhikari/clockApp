import 'package:alarmclock/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = timezoneString.startsWith('-') ? '' : '+';

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF2D2F41),
      elevation: 0,
        title: const Text(
          "Clock App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFF2D2F41),
      
      body: Row(
        children: [
          Container(
            width: 100,
            color: const Color(0xFF1A1C29),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color(0xFF1A1C29),
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Column(
                    children: const [
                      FlutterLogo(),
                      SizedBox(height: 8),
                      Text(
                        'Clock',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Clock",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    formattedTime,
                    style: const TextStyle(color: Colors.white, fontSize: 60),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    formattedDate,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 32),
                  // Replace ClockView with your actual implementation
                  ClockView(),
                  const SizedBox(height: 32),
                  const Text(
                    "Timezone",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.language, color: Colors.white),
                      const SizedBox(width: 16),
                      Text(
                        'UTC$offsetSign$timezoneString',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
