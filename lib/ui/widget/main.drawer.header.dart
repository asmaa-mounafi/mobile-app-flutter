import 'package:flutter/material.dart';

class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white,Colors.blue])
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const CircleAvatar(
              radius : 50,
              backgroundImage: AssetImage("images/profile.png"),
            ),
            IconButton(onPressed: (){},
                icon: const Icon(Icons.settings))
          ],

        ))
    ;
  }
}
