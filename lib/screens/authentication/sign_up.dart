import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _name;

  String _email;

  String _password;

  String _rePassword;

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
                margin: const EdgeInsets.symmetric(horizontal: 28.0),
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
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.perm_identity),
                      ),
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      onChanged: (name) => _name = name,
                    ),
                    const SizedBox(height: 14.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Email Address',
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
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      onChanged: (pass) => _password = pass,
                    ),
                    const SizedBox(height: 14.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Re Enter Your Password',
                        prefixIcon: Icon(Icons.security),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      onChanged: (rePass) => _rePassword = rePass,
                    ),
                    const SizedBox(height: 14.0),
                    SizedBox(
                      width: size.width,
                      height: 40,
                      child: RaisedButton(
                        child: Text(
                          'SignUp',
                          style: GoogleFonts.notoSans(textStyle: TextStyle(fontSize: 20.0)),
                        ),
                        textColor: Colors.white,
                        color: Colors.greenAccent,
                        onPressed: () {},
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
