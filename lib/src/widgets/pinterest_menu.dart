import 'package:flutter/material.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
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
  PinterestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _PinterestMenuBackground(child: _MenuItems(items)),
    );
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
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: 25,
        color: Colors.blueGrey,
      ),
    );
  }
}
