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

    double iconSize = 1.8; // Increase this value for larger icons
    double buttonPadding = 20.0; // Padding for buttons
    double clockPadding = 40.0; // Padding for clock section to ensure spacing
    double clockTextPadding = 50.0; // Added padding to lower the "Clock" text
    double logoPadding = 40.0; // Padding for logo section to ensure spacing

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
                buildMenuButton('Clock', 'assets/clock.png', iconSize, buttonPadding),
                buildMenuButton('Alarm', 'assets/alarm.png', iconSize, buttonPadding),
                buildMenuButton('Timer', 'assets/timer.png', iconSize, buttonPadding),
                buildMenuButton(' Stop\nWatch', 'assets/stopwatch.png', iconSize, buttonPadding),
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
                    child: Padding(
                      padding: EdgeInsets.only(bottom: logoPadding), // Pushes the logo lower
                      child: Image.asset(
                        'assets/first.png', // Replaced Clock text with the logo
                        width: 300, // Increased width for a larger logo
                        height: 150, // Increased height for a larger logo
                        fit: BoxFit.contain, // Ensures logo maintains aspect ratio
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        Text(
                          formattedTime,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  const Flexible(
                      flex: 4,
                      child: Align(
                          alignment: Alignment.center,
                          child: ClockView(
                            size: 300,
                          ))),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Text(
                            "Timezone",
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 20),
                          ),
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

  Padding buildMenuButton(String title, String image, double iconSize, double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
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
              width: iconSize * 30, // Making the icons larger
              height: iconSize * 30, // Making the icons larger
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
