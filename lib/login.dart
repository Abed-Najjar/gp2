import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp2/signup.dart';
import 'package:gp2/forgot_password.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1)
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

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

  Future<void> _handleLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await ApiService.login(
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      );

      if (!mounted) return;

      if (response['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'] ?? 'Login failed')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
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
                      'Welcome back',
                      style: GoogleFonts.inder(
                        fontSize: getResponsiveFontSize(context, 35),
                        color: const Color.fromRGBO(10, 31, 68, 1),
                      ),       
                    ),
                    Text(
                      'Login to your account',
                      style: GoogleFonts.inder(
                        fontSize: getResponsiveFontSize(context, 16),
                        color: const Color.fromRGBO(66, 66, 66, 0.31)
                      ),
                    ),

                    SizedBox(height: getResponsiveHeight(context, 8)),
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Color.fromRGBO(126, 131, 137, 1),
                        fontSize: getResponsiveFontSize(context, 14),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 1)),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: TextField(
                        controller: _usernameController,
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

                    SizedBox(height: getResponsiveHeight(context, 3)),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Color.fromRGBO(126, 131, 137, 1),
                        fontSize: getResponsiveFontSize(context, 14),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 1)),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: TextField(
                        controller: _passwordController,
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
                        obscureText: _obscurePassword,
                      ),
                    ),
            
                    SizedBox(height: getResponsiveHeight(context, 3)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const ForgotPasswordScreen(),
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
                          'Forgot your password?',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 55, 166, 1),
                            fontSize: getResponsiveFontSize(context, 15),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: getResponsiveHeight(context, 3)),
                    
                    Center(
                      child: SizedBox(
                        width: getResponsiveWidth(context, 80),
                        height: getResponsiveHeight(context, 5),
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(0, 55, 166, 1),
                            padding: EdgeInsets.symmetric(
                              vertical: getResponsiveHeight(context, 1),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(39),
                            ),
                          ),
                          child: _isLoading
                              ? SizedBox(
                                  height: getResponsiveHeight(context, 3),
                                  width: getResponsiveHeight(context, 3),
                                  child: const CircularProgressIndicator(color: Colors.white),
                                )
                              : Text(
                                  'Login',
                                  style: GoogleFonts.inder(
                                    fontSize: getResponsiveFontSize(context, 15),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                        ), 
                      ),
                    ),

                    SizedBox(height: getResponsiveHeight(context, 7)),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
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
                                  pageBuilder: (_, __, ___) => const SignupScreen(),
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
                                  transitionDuration: const Duration(milliseconds: 300),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Sign up',
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