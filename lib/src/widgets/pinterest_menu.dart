import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {

  final bool mostrar;

  final List<PinterestButton> items = [
    PinterestButton(
        onPressed: () {
          print('Icon pie_chart');
        },
        icon: Icons.pie_chart),
    PinterestButton(
        onPressed: () {
          print('Icon search');
        },
        icon: Icons.search),
    PinterestButton(
        onPressed: () {
          print('Icon notifications');
        },
        icon: Icons.notifications),
    PinterestButton(
        onPressed: () {
          print('Icon supervised_user_circle');
        },
        icon: Icons.supervised_user_circle),
  ];
  
  PinterestMenu({super.key, this.mostrar = true});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: _PinterestMenuBackground(child: AnimatedOpacity(duration: const Duration(milliseconds: 250),opacity: (mostrar)? 1 : 0,child: _MenuItems(items))));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuButton(index, menuItems[index])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).getItemSeleccionado;

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).setItemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (itemSeleccionado == index) ? 35 : 25,
        color: (itemSeleccionado == index) ? Colors.black : Colors.blueGrey
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get getItemSeleccionado => _itemSeleccionado;

  set setItemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
