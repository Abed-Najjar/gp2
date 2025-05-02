import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp2/login.dart';
import 'api_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _termsAccepted = false;

  double getResponsiveHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  double getResponsiveWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  double getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    return baseSize * (screenWidth / 375); // 375 is base width for design
  }

  bool _areFieldsFilled() {
    return _nameController.text.isNotEmpty && 
           _emailController.text.isNotEmpty && 
           _passwordController.text.isNotEmpty &&
           _termsAccepted;
  }

  Future<void> _handleSignup() async {
    if (_nameController.text.isEmpty || 
        _emailController.text.isEmpty || 
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept terms & conditions')),
      );
      return;
    }

    setState(() => _isLoading = true);
    
    try {
      final response = await ApiService.signup(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (!mounted) return; // Add mounted check after async operation

      if (response['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup successful! Please login')),
        );
        Navigator.pop(context); // Return to login screen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'Signup failed')),
        );
      }
    } catch (e) {
      if (!mounted) return; // Add mounted check after async operation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      if (mounted) { // Add mounted check in finally block
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight - padding.top - padding.bottom,
          ),
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: getResponsiveHeight(context, 30),
                color: const Color.fromRGBO(243, 249, 241, 1),
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'images/fnan1.png',
                  height: getResponsiveHeight(context, 25),
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getResponsiveWidth(context, 6),
                  vertical: getResponsiveHeight(context, 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getResponsiveHeight(context, 2)),
                    Text(
                      'Welcome',
                      style: GoogleFonts.inder(
                        fontSize: getResponsiveFontSize(context, 35),
                        color: const Color.fromRGBO(66, 66, 66, 1),
                      ),
                    ),
                    Text(
                      'Hello there, sign up to continue!',
                      style: GoogleFonts.inder(
                        fontSize: getResponsiveFontSize(context, 16),
                        color: const Color.fromRGBO(66, 66, 66, 0.31),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 4)),
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Color.fromRGBO(126, 131, 137, 1),
                        fontSize: getResponsiveFontSize(context, 16),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 1)),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: TextField(
                        controller: _nameController,
                        style: TextStyle(fontSize: getResponsiveFontSize(context, 16)),
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                            color: const Color.fromRGBO(158, 158, 158, 1),
                            fontSize: getResponsiveFontSize(context, 16),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: getResponsiveWidth(context, 4),
                            vertical: getResponsiveHeight(context, 1.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 2)),
                    Text(
                      'Email address',
                      style: TextStyle(
                        color: Color.fromRGBO(126, 131, 137, 1),
                        fontSize: getResponsiveFontSize(context, 16),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 1)),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(fontSize: getResponsiveFontSize(context, 16)),
                        decoration: InputDecoration(
                          hintText: 'Enter email address',
                          hintStyle: TextStyle(
                            color: const Color.fromRGBO(158, 158, 158, 1),
                            fontSize: getResponsiveFontSize(context, 16),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: getResponsiveWidth(context, 4),
                            vertical: getResponsiveHeight(context, 1.5),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 3)),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Color.fromRGBO(126, 131, 137, 1),
                        fontSize: getResponsiveFontSize(context, 16),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 1)),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: TextStyle(fontSize: getResponsiveFontSize(context, 16)),
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(context, 16),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: getResponsiveWidth(context, 4),
                            vertical: getResponsiveHeight(context, 1.5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                              size: getResponsiveFontSize(context, 24),
                            ),
                            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Padding(
                            padding: EdgeInsets.only(top: getResponsiveHeight(context, 1)),
                            child: Transform.scale(
                              scale: getResponsiveFontSize(context, 15) / 24,
                              child: Checkbox(
                                value: _termsAccepted,
                                onChanged: (bool? value) {
                                  setState(() => _termsAccepted = value ?? false);
                                },
                                activeColor: Color.fromRGBO(0, 55, 166, 1),
                              ),
                            ),
                          ),
                        SizedBox(
                          width: getResponsiveWidth(context, 1)),
                        Flexible(
                          child: 
                          
                            Text(
                              'By creating an account, you agree to our Terms & Conditions',
                              style: TextStyle(
                                color: Color.fromRGBO(59, 89, 152, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: getResponsiveFontSize(context, 13),
                              ),
                            ),

                        ),
                      ],
                    ),
                    SizedBox(height: getResponsiveHeight(context, 5)),
                    Center(
                      child: SizedBox(
                        width: getResponsiveWidth(context, 80),
                        height: getResponsiveHeight(context, 6),
                        child: ElevatedButton(
                          onPressed: (_isLoading || !_areFieldsFilled()) ? null : _handleSignup,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _areFieldsFilled() 
                              ? Color.fromARGB(255, 0, 55, 166)
                              : Color.fromRGBO(230, 235, 246, 1),
                            padding: EdgeInsets.symmetric(
                              vertical: getResponsiveHeight(context, 1),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(39),
                            ),
                            // Add disabledBackgroundColor to maintain the same color when disabled
                            disabledBackgroundColor: Color.fromRGBO(230, 235, 246, 1),
                          ),
                          child: _isLoading
                              ? SizedBox(
                                  height: getResponsiveHeight(context, 3),
                                  width: getResponsiveHeight(context, 3),
                                  child: const CircularProgressIndicator(color: Colors.white),
                                )
                              : Text(
                                  'Sign up',
                                  style: GoogleFonts.inder(
                                    fontSize: getResponsiveFontSize(context, 15),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 5)),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: const Color.fromRGBO(196, 196, 196, 1),
                              fontSize: getResponsiveFontSize(context, 14),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => const LoginScreen(),
                                  transitionsBuilder: (_, animation, __, child) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(1.0, 0.0),
                                        end: Offset.zero,
                                      ).animate(CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeOutCubic,
                                      )),
                                      child: child,
                                    );
                                  },
                                  transitionDuration: const Duration(milliseconds: 250),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 55, 166, 1),
                                fontSize: getResponsiveFontSize(context, 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 2)),
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