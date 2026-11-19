import 'package:flutter/material.dart';

void main() {
  runApp(const CyclocompApp());
}

class CyclocompApp extends StatelessWidget {
  const CyclocompApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyclocomp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const CyclocompScreen(),
    );
  }
}

class CyclocompScreen extends StatefulWidget {
  const CyclocompScreen({super.key});

  @override
  State<CyclocompScreen> createState() => _CyclocompScreenState();
}

class _CyclocompScreenState extends State<CyclocompScreen> {
  bool isRunning = false;

  // Dummy cycling data
  final double speed = 24.6;
  final int heartRate = 142;
  final double distance = 32.4;
  final int elevation = 183;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cyclocomp'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Main speed
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        speed.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('km/h', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),

              // Stats
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        label: 'Heart Rate',
                        value: '$heartRate',
                        unit: 'bpm',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        label: 'Distance',
                        value: distance.toStringAsFixed(1),
                        unit: 'km',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        label: 'Elevation',
                        value: '$elevation',
                        unit: 'm',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Start / Stop button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      isRunning = !isRunning;
                    });
                  },
                  child: Text(isRunning ? 'STOP RIDE' : 'START RIDE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const _StatCard({
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(unit, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
