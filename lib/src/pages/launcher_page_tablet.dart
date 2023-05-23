import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/models/layout_model.dart';
//import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/theme/them_changer.dart';
import 'package:disenos_app/src/routes/routes.dart';

class LauncherPageTablet extends StatelessWidget {
  const LauncherPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    //final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final appTheme2 = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.account_circle,
                color: (appTheme2.darkTheme) ? Colors.black54 : Colors.white,
              ));
        }),
        title: Text(
          'Diseños en Flutter-Tablet',
          style: TextStyle(
              color: (appTheme2.darkTheme) ? Colors.black54 : Colors.white),
        ),
        backgroundColor: appTheme2.currentTheme.colorScheme.secondary,
      ),
      drawer: _MenuPrincipal(),
      body: Row(
        children: [
          SizedBox(
            width: 250,
            height: double.infinity,
            child: _ListadeOpciones(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: (appTheme2.darkTheme)
                ? Colors.grey
                : appTheme2.currentTheme.primaryColorLight,
          ),
          Expanded(child: layoutModel.currentPage)
        ],
      ),
      //body: _ListadeOpciones(),
    );
  }
}

class _ListadeOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
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
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => pageRoutes[i].page));
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[i].page;
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final appTheme2 = Provider.of<ThemeChanger>(context).currentTheme;
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: appTheme2.colorScheme.secondary,
                child: const Text(
                  'CS',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Expanded(child: _ListadeOpciones()),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outlined,
              color: appTheme2.colorScheme.secondary,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: appTheme2.colorScheme.secondary,
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
              leading: Icon(
                Icons.add_to_home_screen,
                color: appTheme2.colorScheme.secondary,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme2.colorScheme.secondary,
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
