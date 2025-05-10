import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseCareScreen extends StatelessWidget {
  const ChooseCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Hi bablo',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: const AssetImage('images/girl.png'),
              radius: 20,
            ),
          ),
        ],
      ),      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              children: [
                Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: _getResponsiveHeight(context, 0.15),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(236, 241, 232, 1),
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                  image: AssetImage('images/zigzag.png'),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  ),
                ),
                width: _getResponsiveWidth(context,.91) - 32, // Adjusted width to account for margins
                child: Center(
                  child: Text(
                  'What do you care about?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  ),
                ),
                ),
                Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: _getResponsiveHeight(context, 0.15),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(236, 241, 232, 1),
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                  image: AssetImage('images/zigzag.png'),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  ),
                ),
                width: _getResponsiveWidth(context,.91) - 32, // Adjusted width to account for margins
                child: Center(
                  child: Text(
                  'What do you care about?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  ),
                ),
                ),
              ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
                children: const [
                  CategoryCard(
                    title: 'Athlete',
                    imagePath: 'images/athlete_logo.png',
                  ),
                  CategoryCard(
                    title: 'Nutrition',
                    imagePath: 'images/nutrition_logo.png',
                  ),
                  CategoryCard(
                    title: 'Home Gardens',
                    imagePath: 'images/house_gardens_logo.png',
                  ),
                  CategoryCard(
                    title: 'Farms',
                    imagePath: 'images/farmer_logo.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to calculate responsive height based on screen size
  double _getResponsiveHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }
  
  // Helper method to calculate responsive width based on screen size
  double _getResponsiveWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  
  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle the tap event
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You selected $title'),
            duration: const Duration(seconds: 1),
          ),
        );
        // You can navigate to a new screen here based on the card clicked
        // For example:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DetailScreen(category: title)),
        // );
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Center the icon in the card
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  imagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Position text at bottom left
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(54, 58, 51, 1)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}