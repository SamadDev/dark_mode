import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedproject/DarkMode.dart';

class DrawerRa extends StatefulWidget {
  @override
  _DrawerRaState createState() => _DrawerRaState();
}

class _DrawerRaState extends State<DrawerRa> {
  initState() {
    super.initState();
    getMode();
  }
  void getMode() {Provider.of<DarkThemePreference>(context, listen: false).getTheme();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<DarkThemePreference>(
          builder: (ctx, mode, _) => Switch(
              value: DarkThemePreference.darkTheme,
              onChanged: (value) {
                setState(() {
                  DarkThemePreference.darkTheme = value;
                  mode.setDarkTheme(value);
                  print(DarkThemePreference.darkTheme);
                });
              }),
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function onTap;

  const _ListTile(
      {Key key,
      this.title,
      this.icon,
      this.color = const Color(0xff9E9E9E),
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        'title',
        // Provider.of<Language>(context).generalWords[title],
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final String code;
  final String direction;

  const _LanguageButton(
      {Key key,
      @required this.label,
      @required this.code,
      @required this.direction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final palletteColor = Provider.of<PaletteColor>(context, listen: false);
    return FlatButton(
      minWidth: double.infinity,
      textColor: Colors.white30,
      // textColor: Language.languageCode == code
      //     ? palletteColor.green100
      //     : palletteColor.white200,
      onPressed: () {
        // Provider.of<Language>(context, listen: false)
        //     .setLanguageCode(code, direction);
      },
      child: Text(label, style: TextStyle(fontFamily: 'NRT-Reg')),
    );
  }
}

