import 'package:flutter/material.dart';
import 'package:noted/services/theme_service.dart';
import 'package:provider/provider.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return IconButton(
        onPressed: () => themeService.switchTheme(),
        icon: themeService.getTheme() == ThemeMode.dark
            ? Icon(Icons.light_mode)
            : Icon(Icons.dark_mode),
      );
    });
  }
}
