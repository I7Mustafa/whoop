import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whoop/screens/authentication/sign_up.dart';
import 'package:whoop/services/auth_services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthServices _authServices = AuthServices();
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
                                color: Theme.of(context).accentColor,
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Theme.of(context).cardColor,
                        filled: true,
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      onChanged: (email) => _email = email,
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Theme.of(context).cardColor,
                        filled: true,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.security),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      onChanged: (pass) => _password = pass,
                    ),
                    const SizedBox(height: 12.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: size.width,
                      height: 38,
                      child: RaisedButton(
                        child: Text(
                          'SignIn',
                          style: GoogleFonts.notoSans(
                            textStyle: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'OR',
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: size.width,
                      height: 38,
                      child: FlatButton(
                        onPressed: () => _authServices.signInWithGoogle(context),
                        textColor: Colors.white,
                        color: Theme.of(context).accentColor,
                        child: Text(
                          'SignIn with Google',
                          style: GoogleFonts.notoSans(textStyle: TextStyle(fontSize: 20.0)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have Account?',
                          style: GoogleFonts.notoSans(
                            textStyle: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          ),
                          child: Text(
                            'SignUp now.',
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        )
                      ],
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
