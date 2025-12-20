import 'package:e_com/features/Entry/presentation/provider/nav_provider.dart';
import 'package:e_com/features/Home/presentation/screens/home_screen.dart';
import 'package:e_com/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final pages = const [
    HomeScreen(),
    CartScreen(),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavProvider>();

    return Scaffold(
      body: BottomBar(
        barColor: Colors.black,
        borderRadius: BorderRadius.circular(20),
        width: MediaQuery.of(context).size.width * 0.9,

        body: (context, controller) {
          return pages[nav.currentIndex];
        },

        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _item(Icons.home, 0, nav),
              _item(Icons.shopping_cart_outlined, 1, nav),
              _item(Icons.person_outline, 2, nav),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(IconData icon, int i, NavProvider nav) {
    final isActive = nav.currentIndex == i;
    return IconButton(
      icon: Icon(
        icon,
        color: isActive ? Colors.orange : Colors.white70,
      ),
      onPressed: () => nav.setIndex(i),
    );
  }
}
