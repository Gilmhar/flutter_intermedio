import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1Backg;
  final Color color2Backg;
  final Function() onPress;

  const BotonGordo(
      {super.key,
      this.icon = FontAwesomeIcons.userPlus,
      required this.texto,
      this.color1Backg = Colors.grey,
      this.color2Backg = Colors.blueGrey,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(icon, color1Backg, color2Backg),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 130, width: 40),
              FaIcon(icon, color: Colors.white, size: 40),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                texto,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )),
              const FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1Backg;
  final Color color2Backg;

  const _BotonGordoBackground(this.icon, this.color1Backg, this.color2Backg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [
            color1Backg,
            color2Backg,
          ])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.1),
                ))
          ],
        ),
      ),
    );
  }
}
