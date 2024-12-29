import 'package:alarmclock/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Container(
            width: 100,
            color: const Color(0xFF1A1C29),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMenuButton('Clock', 'assets/clock.png'),
                buildMenuButton('Alarm', 'assets/alarm.png'),
                buildMenuButton('Timer', 'assets/timer.png'),
                buildMenuButton(' Stop\nWatch', 'assets/stopwatch.png'),
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
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "Clock",
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        Text(
                          formattedTime,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  const Flexible(flex: 4,
                   child: Align(
                    alignment: Alignment.center,
                    child: ClockView(size: 300,))),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Timezone",
                          style:
                              GoogleFonts.lato(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.language, color: Colors.white),
                            const SizedBox(width: 16),
                            Text(
                              'UTC$offsetSign$timezoneString',
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF1A1C29),
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              image,
              scale: 1.5,
            ),
            const SizedBox(height: 16),
            Text(
              title ?? '',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}