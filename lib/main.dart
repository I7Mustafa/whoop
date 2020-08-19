import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whoop/screens/authentication/sign_in.dart';
import 'package:whoop/screens/list_of_recent_chat.dart/list_of_recent_chat.dart';
import 'package:whoop/services/shared_preferences_services.dart';
import 'package:whoop/utilts/whoop_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool theme;
  String userId;
  await getBoolFromSharedPreferences('darkTheme').then((value) => theme = value);
  await getStringFromSharedPreferences('id').then((value) => userId = value);
  print(userId);
  runApp(
    ChangeNotifierProvider<WhoopTheme>(
      create: (context) => WhoopTheme(
        whoopTheme: theme == false || theme == false ? WhoopTheme.lightTheme : WhoopTheme.darkTheme,
      ),
      child: MyApp(userId: userId),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String userId;

  const MyApp({Key key, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<WhoopTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whoop',
      theme: theme.getTheme(),
      home: userId != null ? ListOfRecentChat() : SignIn(),
    );
  }
}
