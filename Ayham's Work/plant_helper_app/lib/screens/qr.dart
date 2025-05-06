import 'package:flutter/material.dart';
import 'dart:math';
import 'package:qr_flutter/qr_flutter.dart';


class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8CD7AF), // Hex color #8cd7af
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: constraints.maxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.12),
                    // QR Code Container
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => _buildPopup(context),
                        );
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.6,
                        height: constraints.maxWidth * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            CustomPaint(
                              size: Size(constraints.maxWidth * 0.6, constraints.maxWidth * 0.6),
                              painter: _CornerBorderPainter(),
                            ),
                            Center(
                              child: QrImageView(
                                data: "https://example.com",
                                version: QrVersions.auto,
                                size: constraints.maxWidth * 0.5,
                                gapless: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: constraints.maxHeight * 0.05),
                    Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontSize: constraints.maxHeight < 600 ? 22 : 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.04),
                    Text(
                      'Glasses Setup',
                      style: TextStyle(
                        fontSize: constraints.maxHeight < 600 ? 22 : 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Darker grey for better contrast
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.1,
                      ),
                      child: Text(
                        'Scan the QR code on the glasses to begin managing your patient’s care.',
                        style: TextStyle(
                          fontSize: constraints.maxHeight < 600 ? 14 : 16,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class _CornerBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0DFF39)
      ..strokeWidth = 5 
      ..style = PaintingStyle.stroke;

    const radius = 20.0;

    canvas.drawArc(
      const Rect.fromLTWH(0, 0, radius * 2, radius * 2),
      pi,
      pi / 2,
      false,
      paint,
    );

    // Top-right corner
    canvas.drawArc(
      Rect.fromLTWH(size.width - radius * 2, 0, radius * 2, radius * 2),
      -pi / 2,
      pi / 2,
      false,
      paint,
    );

    // Bottom-left corner
    canvas.drawArc(
      Rect.fromLTWH(0, size.height - radius * 2, radius * 2, radius * 2),
      pi / 2,
      pi / 2,
      false,
      paint,
    );

    // Bottom-right corner
    canvas.drawArc(
      Rect.fromLTWH(
        size.width - radius * 2,
        size.height - radius * 2,
        radius * 2,
        radius * 2,
      ),
      0,
      pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Widget _buildPopup(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    contentPadding: const EdgeInsets.all(24),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/success_connection.png',
          width: 120,
          height: 120,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        const Text(
          'Your Glasses are Connected',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0037A6),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 16,
              color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
