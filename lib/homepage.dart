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
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: (){},
               child: const Column(
                children: [
                  FlutterLogo(),
                  Text('Clock', style: TextStyle(color: Colors.white, fontSize: 14),)
                ],
               )
               ),
            ],
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Container(
            alignment: Alignment.center,
            color: const Color(0xFF2D2F41),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Clock",
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                const SizedBox(
                  height: 32,
                ),
                Text(formattedTime,
                    style: const TextStyle(color: Colors.white, fontSize: 60)),
                const SizedBox(
                  height: 32,
                ),
                Text(formattedDate,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                const ClockView(),
                const Text("Timezone",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(
                  width: 16,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'UTC' +  offsetSign + timezoneString,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
