import 'package:flutter/material.dart';
import 'package:nymble_mt/provider/theme_provider.dart';
import 'package:nymble_mt/screens/home_screen.dart';
import 'package:nymble_mt/utils/themeColors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeConfig>(create: (_) => ThemeConfig()),
      ],
      child: Consumer<ThemeConfig>(
        builder: (context, ThemeConfig themeConfig,child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme:  getAppTheme(context, !themeConfig.theme),
            debugShowCheckedModeBanner: false,
            // themeConfig.theme ? ThemeData.light():ThemeData.dark(),
            home: const HomePage(title: 'Nymble'),
          );
        }
      ),
    );
  }
}
