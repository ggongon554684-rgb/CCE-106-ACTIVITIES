import 'package:flutter/material.dart';

void main() => runApp(const WaterTrackerApp());

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WaterTrackerScreen(),
    );
  }
}

class WaterTrackerScreen extends StatelessWidget {
  const WaterTrackerScreen({super.key});

  Widget _tip(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE9FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E3FAE),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B5FC9),
        centerTitle: true,
        title: const Text(
          'Water Tracker',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Icon(Icons.water_drop, size: 80, color: Color(0xFF3B9EFF)),
            const SizedBox(height: 12),
            const Text(
              'Stay Hydrated!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Build a healthy daily habit',
              style: TextStyle(fontSize: 16, color: Color(0xFF4B5563)),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    'Daily Water Goal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF374151),
                    ),
                  ),
                  Text(
                    '8',
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF2547B8),
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'glasses per day',
                    style: TextStyle(fontSize: 16, color: Color(0xFF4B5563)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _tip('Drink water regularly'),
            const SizedBox(height: 12),
            _tip('Bring your water bottle'),
            const SizedBox(height: 16),
            const Text(
              'Every glass counts!',
              style: TextStyle(fontSize: 12, color: Color(0xFF374151)),
            ),
          ],
        ),
      ),
    );
  }
}
