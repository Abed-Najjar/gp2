import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'articles_and_recommendations.dart';
import 'water_consumption.dart';
import 'quick_guide.dart';
import 'general_advice.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  final String userName = "John";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF3F9F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Greeting + Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi $userName",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
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
                          width: 50,  
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Suggestion Card
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/vector.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Color(0xFFECF1E8),
                      BlendMode.darken,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Suggestions that may help you',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16), // This adds margin between the two sections

              // 4 Rectangular Buttons (Grid)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.77,
                  children: [
                    // Your feature cards here
                    _buildFeatureCard('assets/document.png', "Articles and Recommendations", () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ArticlesAndRecommendations()));                    }),
                    _buildFeatureCard('assets/water.png', "Water Consumption", () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const WaterConsumption()));
                    }),
                    _buildFeatureCard('assets/book.png', "Quick Guide", () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const QuickGuide()));
                    }),
                    _buildFeatureCard('assets/bulb.png', "General Advice", () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const GeneralAdvice()));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _buildFeatureCard(String imagePath, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 180, height: 180),
          const SizedBox(height: 1),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF363A33),
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}
