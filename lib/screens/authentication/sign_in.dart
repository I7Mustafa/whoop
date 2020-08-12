import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email;

  String _password;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Center(
            child: Form(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'WHOO',
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                                fontSize: 36,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'P',
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      onChanged: (email) => _email = email,
                    ),
                    const SizedBox(height: 14.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.security),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      onChanged: (pass) => _password = pass,
                    ),
                    const SizedBox(height: 14.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    SizedBox(
                      width: size.width,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          'LogIn',
                          style: GoogleFonts.notoSans(textStyle: TextStyle(fontSize: 22.0)),
                        ),
                        textColor: Colors.white,
                        color: Colors.greenAccent,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have Account? ',
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'SignUp now.',
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
