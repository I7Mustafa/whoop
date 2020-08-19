import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whoop/screens/authentication/sign_in.dart';
import 'package:whoop/services/auth_services.dart';

class ListOfRecentChat extends StatefulWidget {
  @override
  _ListOfRecentChatState createState() => _ListOfRecentChatState();
}

class _ListOfRecentChatState extends State<ListOfRecentChat> {
  AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => PopupMenuButton(itemBuilder: (context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem(
                  child: Text('Settings'),
                  value: 'settings',
                ),
                PopupMenuItem(
                  child: Text('Sign Out'),
                  value: 'signOut',
                ),
              ];
            }, onSelected: (value) {
              if (value == 'settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                );
              } else {
                try {
                  _authServices.signOut(context, 'Sign Out Sucssesfuly').whenComplete(() =>
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Sign Out Sucssesfuly'))));
                } catch (e) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              }
            }),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            Text(
              'Conversation',
              style: GoogleFonts.notoSans(
                textStyle: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 18.0,
                    color: Colors.black12,
                    offset: Offset(8, 8),
                  )
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(75),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(75),
                  ),
                  border: InputBorder.none,
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
                  hintText: 'Search a friend',
                  prefixIcon: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(75),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                // onChanged: (email) => _email = email,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
