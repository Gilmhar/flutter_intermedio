import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/theme/them_changer.dart';
import 'package:disenos_app/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListadeOpciones(),
    );
  }
}

class _ListadeOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  'CS',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Expanded(child: _ListadeOpciones()),
          ListTile(
            leading: const Icon(
              Icons.lightbulb_outlined,
              color: Colors.blue,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: Colors.green,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                }),
          ),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: const Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  }),
            ),
          )
        ],
      ),
    );
  }
}
