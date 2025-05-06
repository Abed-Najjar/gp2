import 'package:flutter/material.dart';
import 'settings_screen.dart';

class QuickGuide extends StatelessWidget {
  const QuickGuide({super.key});

  @override
  Widget build(BuildContext context) {
    const String userName = "John";

    return Scaffold(
      backgroundColor: const Color(0xFFEBF1EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hi $userName",
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      const SizedBox(width: 10),  
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SettingsScreen()),
                          );
                        },
                        child: Image.asset(
                          'assets/settings.png',
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),

              // Expanded container fills remaining space
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const SingleChildScrollView(
                    child: Text(
                      'This is the General Advice content area. '
                      'You can add more paragraphs or widgets here, and it will scroll properly. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. '
                      'Repeat this a lot to simulate long content. ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
