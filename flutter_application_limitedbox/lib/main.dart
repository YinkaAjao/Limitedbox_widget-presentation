import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LimitedBox Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'LimitedBox Widget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // LimitedBox Demo Section - START HERE
            const Text(
              'LimitedBox Demo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'The LimitedBox widgets below impose maximum constraints only when their parent provides unconstrained dimensions (like in ListView).',
              style: TextStyle(color: Colors.grey),
            ),
            
            const SizedBox(height: 20),
            
            // Example 1: LimitedBox in ListView (most common use case)
            const Text(
              '1. LimitedBox in ListView (prevents infinite height):',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                children: [
                  // Without LimitedBox, these containers would try to be infinite height
                  LimitedBox(
                    maxHeight: 80, // Maximum height when unconstrained
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      color: Colors.blue.withOpacity(0.3),
                      child: const Center(child: Text('LimitedBox maxHeight: 80')),
                    ),
                  ),
                  LimitedBox(
                    maxHeight: 60,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      color: Colors.green.withOpacity(0.3),
                      child: const Center(child: Text('LimitedBox maxHeight: 60')),
                    ),
                  ),
                  LimitedBox(
                    maxHeight: 100,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      color: Colors.orange.withOpacity(0.3),
                      child: const Center(child: Text('LimitedBox maxHeight: 100')),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Example 2: LimitedBox in Row
            const Text(
              '2. LimitedBox in Row (prevents infinite width):',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // This LimitedBox prevents the container from expanding infinitely
                LimitedBox(
                  maxWidth: 150, // Maximum width when unconstrained
                  child: Container(
                    height: 50,
                    color: Colors.purple.withOpacity(0.3),
                    child: const Center(child: Text('Limited width in Row')),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.red.withOpacity(0.3),
                  child: const Center(child: Text('Fixed width')),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Example 3: Comparison - Without LimitedBox
            const Text(
              '3. Without LimitedBox (problematic):',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                children: [
                  // This container tries to be infinite height (causes layout errors)
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    color: Colors.red.withOpacity(0.2),
                    child: const Center(
                      child: Text(
                        'Without LimitedBox - tries to be infinite!',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Reference information
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About LimitedBox:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• LimitedBox only applies constraints when parent provides unconstrained dimensions\n'
                      '• Commonly used in ListView, GridView, or other scrollable widgets\n'
                      '• Prevents children from expanding infinitely\n'
                      '• If parent provides constraints, LimitedBox respects those instead',
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Learn more: https://api.flutter.dev/flutter/widgets/LimitedBox-class.html',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blue[700],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}