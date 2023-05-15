import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _MiScroll());
  }
}

class _MiScroll extends StatelessWidget {
  final items = const [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // const SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola mundo'),
        // ),
        SliverPersistentHeader(
            floating: true, delegate: _SliverCustomHeaderDelegate()),
        SliverList(delegate: SliverChildListDelegate(items))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }

}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
                bottom: 8,
                child: Container(
                  width: 130,
                  height: 8,
                  color: const Color(0xffF7CDD5),
                )),
            Container(
              child: const Text(
                'List',
                style: TextStyle(color: Color(0xffD93A30), fontSize: 50),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = const [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        titulo,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
