import 'package:flutter/material.dart';

class CurvedNavigationBarItem {
  const CurvedNavigationBarItem({
    required this.iconData,
    this.selectedIconData,
  });

  final IconData iconData;
  final IconData? selectedIconData;
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..quadraticBezierTo(size.width * 0.5, kToolbarHeight, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CurvedNavigationBar extends StatelessWidget {
  const CurvedNavigationBar({
    super.key,
    required this.items,
    this.onTap,
    this.unselectedColor = Colors.white,
    this.selectedColor = Colors.yellowAccent,
    this.currentIndex = 1,
  }) : assert(items.length == 4);

  final List<CurvedNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final Color unselectedColor;
  final Color selectedColor;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedClipper(),
      child: Container(
        alignment: const Alignment(0, 1.5),
        height: kToolbarHeight * 1.3,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: (index == 0 || index == 3) ? 17.0 : 0,
              ),
              child: IconButton(
                onPressed: () => onTap?.call(index),
                color: index == currentIndex ? selectedColor : unselectedColor,
                icon: Icon(
                  index == currentIndex
                      ? item.selectedIconData ?? item.iconData
                      : item.iconData,
                ),
              ),
            );
          })
            ..insert(2, const SizedBox()),
        ),
      ),
    );
  }
}
