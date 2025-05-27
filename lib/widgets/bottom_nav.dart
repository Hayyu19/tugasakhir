import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int page;
  const BottomNav({required this.page, Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int _currentIndex;

  final List<IconData> _icons = [
    Icons.home,
    Icons.chat_bubble,
    Icons.person,
  ];

 

  final List<String> _routes = [
    '/home',
    '/chat',
    '/profile',
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.page;
  }

  void _navigateTo(int index) async {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    await Future.delayed(Duration(milliseconds: 300));
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / _icons.length;

    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Bar Background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_icons.length, (index) {
                  final isSelected = index == _currentIndex;
                  return GestureDetector(
                    onTap: () => _navigateTo(index),
                    child: SizedBox(
                      width: itemWidth,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _icons[index],
                            color: isSelected ? Colors.transparent : Colors.grey,
                            size: 26,
                          ),
                          
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Tonjolan aktif
          Positioned(
              top: 5,
              left: MediaQuery.of(context).size.width /
                      _icons.length *
                      _currentIndex +
                  MediaQuery.of(context).size.width / _icons.length / 2 -
                  30,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  
                ),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _icons[_currentIndex],
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
