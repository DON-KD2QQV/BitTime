// Copyright (c) 2025 Donald Bryant (RadioOperator.net)
// BitTime - Learn to read time in binary format
// Licensed under the MIT License

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

void main() {
  runApp(const BinaryClockWebApp());
}

class BinaryClockWebApp extends StatelessWidget {
  const BinaryClockWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BitTime - RadioOperator.net',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF111827),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F2937),
          foregroundColor: Colors.white,
        ),
      ),
      home: const BinaryClockScreen(),
    );
  }
}

class BinaryClockScreen extends StatefulWidget {
  const BinaryClockScreen({super.key});

  @override
  State<BinaryClockScreen> createState() => _BinaryClockScreenState();
}

class _BinaryClockScreenState extends State<BinaryClockScreen> {
  late Timer timer;
  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> _openWebsite() async {
    final Uri url = Uri.parse('https://radiooperator.net/binaryclock.html');
    if (!await launchUrl(url)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open the website'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BitTime - RadioOperator.net'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.web),
            onPressed: _openWebsite,
            tooltip: 'Open Website',
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showInfo,
            tooltip: 'How to read',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BitTime',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'RadioOperator.net',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}:${currentTime.second.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            _buildBinaryClock(),
            const SizedBox(height: 40),
            const Text(
              'H  H    M  M    S  S',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _openWebsite,
              icon: const Icon(Icons.web),
              label: const Text('View Full Website'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F2937),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBinaryClock() {
    int hour = currentTime.hour;
    int minute = currentTime.minute;
    int second = currentTime.second;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Hours
        _buildBinaryColumn(hour ~/ 10, 'H1'),
        const SizedBox(width: 8),
        _buildBinaryColumn(hour % 10, 'H2'),
        const SizedBox(width: 20),

        // Minutes
        _buildBinaryColumn(minute ~/ 10, 'M1'),
        const SizedBox(width: 8),
        _buildBinaryColumn(minute % 10, 'M2'),
        const SizedBox(width: 20),

        // Seconds
        _buildBinaryColumn(second ~/ 10, 'S1'),
        const SizedBox(width: 8),
        _buildBinaryColumn(second % 10, 'S2'),
      ],
    );
  }

  Widget _buildBinaryColumn(int digit, String label) {
    List<bool> bits = [
      (digit & 8) != 0, // 8s place
      (digit & 4) != 0, // 4s place
      (digit & 2) != 0, // 2s place
      (digit & 1) != 0, // 1s place
    ];

    return Column(
      children: [
        ...bits.map((bit) => Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: bit ? Colors.green : Colors.grey[800],
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: bit ? Colors.green[300]! : Colors.grey[600]!,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  bit ? '1' : '0',
                  style: TextStyle(
                    color: bit ? Colors.black : Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )),
      ],
    );
  }

  void _showInfo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1F2937),
          title: const Text(
            'How to Read BitTime',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Each column represents a digit in time format HH:MM:SS.\n\n'
            'Each column shows a 4-bit binary number (0-9):\n'
            '• Top row = 8s place\n'
            '• Second row = 4s place\n'
            '• Third row = 2s place\n'
            '• Bottom row = 1s place\n\n'
            'Green dots are "1" bits, grey dots are "0" bits.\n\n'
            'Add up the values where green dots appear to get the decimal digit.\n\n'
            'Click the web icon to view the full website version!\n\n'
            '© 2025 Donald Bryant (RadioOperator.net) - All rights reserved.',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Got it!'),
            ),
          ],
        );
      },
    );
  }
}
