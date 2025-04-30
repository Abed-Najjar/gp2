import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
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
      home:  LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
   const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Wrap(
        
        children: [
        Center(
                child: Container(
                  width: double.infinity,
                  height: 250,
                  color:  Color.fromRGBO(243, 249, 241, 1),
                  alignment: Alignment.bottomCenter,
                  // Replace with your logo image
                child:Image.asset('images/fnan1.png'),
                )
              ),
        Padding(
          padding:  EdgeInsets.only(left: 24.0, right: 24),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
  
              // Welcome Back & 
              SizedBox(height: 30),
              Text(
                'Welcome back',
                style: GoogleFonts.inder(
                  fontSize: 35,
                  color: Color.fromRGBO(10, 31, 68, 1),
                ),       
              ),
              Text(
                'Login to your account',
                style: GoogleFonts.inder(
                  fontSize: 16,
                  color: const Color.fromRGBO(66, 66, 66, 0.31)
                ),
              ),

              // Name TextField
              SizedBox(height: 40),
              Text(
                'Name',
                style: TextStyle(
                  color: Color.fromRGBO(126, 131, 137, 1),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 242, 242, 1),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: const Color.fromRGBO(158, 158, 158, 1),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),

              SizedBox(height: 20), // spacing between text fields

              // Password TextField
              Text(
                'Password',
                style: TextStyle(
                  color: Color.fromRGBO(126, 131, 137, 1),

                ),
              ),
              SizedBox(height: 8),
              Container(
                  decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 242, 242, 1),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  obscureText: true,
                  ),
                ),
            
              SizedBox(height: 8), // spacing between text fields

              // Forgot Password Button
              Align(
                alignment: Alignment.centerRight, // Align to the right
                child: TextButton(

                  // Forgot Password Functionality
                  onPressed: () {
                    // Handle forgot password logic here
                  },
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color:  Color.fromRGBO(0, 55, 166, 1),
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20), // spacing between text fields

              // Login Button
              Center(
                child:
                SizedBox(
                width: 305,
                height: 45,
                child: ElevatedButton(

                  // Login Functionality
                  onPressed: () {
                    // Handle login logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 55, 166, 1),
                    padding:  EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(39),
                    ),
                  ),
                  child: Text('Login',style: GoogleFonts.inder(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                    ),),
                ), 
              ),
              
              ),

              SizedBox(height: 20), // spacing between text fields

              // Sign Up Button
              Center(
                child:
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: const Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                  TextButton(
                    // Sign Up Functionality
                    onPressed: () {
                      // Handle sign up
                    },
                   
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Removes padding around the text
                      minimumSize: Size(0, 0), // Optionally reduce minimum button size
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Fit tap target to content
                    ),
                   
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 55, 166, 1),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
              ),
            ],
          ),
        ),
        ],
      )
      
    );
  }
}