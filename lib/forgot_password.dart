import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'api_service.dart';
import 'login.dart';  // Added import for LoginScreen

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>(); // Added form key
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _isEmailFilled = false;

  // Added validator function for email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  // Add responsive dimensions helper methods
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

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateEmailState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateEmailState);
    _emailController.dispose();
    super.dispose();
  }

  void _updateEmailState() {
    setState(() {
      _isEmailFilled = _emailController.text.isNotEmpty;
    });
  }

  Future<void> _handleForgotPassword() async {
    if (_formKey.currentState!.validate()) { // Validate form before proceeding
      setState(() => _isLoading = true);

      try {
        //final response = await ApiService.forgotPassword(_emailController.text.trim());

        if (!mounted) return;

        // Show the success dialog with new design
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(getResponsiveFontSize(context, 24)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(getResponsiveFontSize(context, 24)),
                ),
                width: getResponsiveWidth(context, 80), // 80% of screen width
                padding: EdgeInsets.all(getResponsiveFontSize(context, 24)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: getResponsiveWidth(context, 30), // 30% of screen width for the image container
                      height: getResponsiveWidth(context, 30), // Keep it square
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Center(
                        child: Image.asset(
                          'images/lock.png',
                          width: getResponsiveWidth(context, 25), // Slightly smaller than container
                          height: getResponsiveWidth(context, 25),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: getResponsiveHeight(context, 2)),
                    Text(
                      'Your password has been reset',
                      style: GoogleFonts.inder( 
                        fontSize: getResponsiveFontSize(context, 24),
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(10, 31, 68, 1)
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: getResponsiveHeight(context, 3)),
                    Text(
                      "You'll shortly receive an email with a code to setup a new password.",
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: getResponsiveFontSize(context, 14),
                        color: const Color.fromRGBO(10, 31, 68, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: getResponsiveHeight(context, 3)),
                    SizedBox(
                      width: getResponsiveWidth(context, 70), // 70% of screen width
                      height: getResponsiveHeight(context, 6), // Consistent with other buttons
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 55, 166, 1),
                          padding: EdgeInsets.symmetric(
                            vertical: getResponsiveHeight(context, 1),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(getResponsiveFontSize(context, 24)),
                          ),
                          alignment: Alignment.center,
                        ),
                        child: Center(
                          child: Text(
                            'Done',
                            style: GoogleFonts.inder(
                              fontSize: getResponsiveFontSize(context, 18),
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } catch (e) {
        // Silently handle any errors
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
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
          child: Form( // Wrapped Column with Form widget
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction, // Enable autovalidation
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  height: getResponsiveHeight(context, 35),
                  color: const Color.fromRGBO(243, 249, 241, 1),
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'images/forgot_password_avatar.png',
                    height: getResponsiveHeight(context, 30),
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
                        'Forgot Password?',
                        style: GoogleFonts.inder(
                          fontSize: getResponsiveFontSize(context, 35),
                          color: const Color.fromRGBO(10, 31, 68, 1),
                        ),
                      ),
                      Text(
                        'Enter the email associated with your account',
                        style: GoogleFonts.inder(
                          fontSize: getResponsiveFontSize(context, 16),
                          color: const Color.fromRGBO(66, 66, 66, 0.31),
                        ),
                      ),

                      SizedBox(height: getResponsiveHeight(context, 7)),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Color.fromRGBO(126, 131, 137, 1),
                          fontSize: getResponsiveFontSize(context, 14),
                        ),
                      ),
                      SizedBox(height: getResponsiveHeight(context, 1)),
                      // Replaced Container with TextFormField
                      TextFormField(
                        controller: _emailController,
                        validator: _validateEmail, // Use the validator function
                        style: TextStyle(fontSize: getResponsiveFontSize(context, 16)),
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            color: const Color.fromRGBO(158, 158, 158, 1),
                            fontSize: getResponsiveFontSize(context, 16),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(242, 242, 242, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: getResponsiveWidth(context, 4),
                            vertical: getResponsiveHeight(context, 1.5),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SizedBox(height: getResponsiveHeight(context, 4)),
                      Center(
                        child: SizedBox(
                          width: getResponsiveWidth(context, 80),
                          height: getResponsiveHeight(context, 5),
                          child: ElevatedButton(
                            onPressed: (_isLoading || !_isEmailFilled) ? null : _handleForgotPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isEmailFilled 
                                ? Color.fromRGBO(0, 55, 166, 1)
                                : Color.fromRGBO(230, 235, 246, 1),
                              padding: EdgeInsets.symmetric(
                                vertical: getResponsiveHeight(context, 1),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(39),
                              ),
                              disabledBackgroundColor: Color.fromRGBO(230, 235, 246, 1),
                            ),
                            child: _isLoading
                                ? SizedBox(
                                    height: getResponsiveHeight(context, 3),
                                    width: getResponsiveHeight(context, 3),
                                    child: const CircularProgressIndicator(color: Colors.white),
                                  )
                                : Text(
                                    'Send Reset Link',
                                    style: GoogleFonts.inder(
                                      fontSize: getResponsiveFontSize(context, 15),
                                      color:Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),

                      SizedBox(height: getResponsiveHeight(context, 15)),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Remember your password? ',
                              style: TextStyle(
                                color: const Color.fromRGBO(196, 196, 196, 1),
                                fontSize: getResponsiveFontSize(context, 14),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Login',
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
      ),
    );
  }
}