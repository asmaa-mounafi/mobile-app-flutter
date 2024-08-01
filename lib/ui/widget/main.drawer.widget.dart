import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.item.widget.dart';
import 'main.drawer.header.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> menus=[
      {"title":"Home","route":"/","leadingIcon":Icons.home,"trailingIcon":Icons.arrow_forward},
      {"title":"Counter Stful","route":"/counter1","leadingIcon":Icons.event,"trailingIcon":Icons.arrow_forward},
      {"title":"Quiz","route":"/quiz","leadingIcon":Icons.quiz,"trailingIcon":Icons.arrow_forward},
       {"title":"Weather","route":"/weather","leadingIcon":Icons.sunny ,"trailingIcon":Icons.arrow_forward},
      {"title":"Gallery","route":"/Gallery","leadingIcon":Icons.image ,"trailingIcon":Icons.arrow_forward},

    ];
    return  Drawer(
      child:  Column(
        children:  [
         const MainDrawerHeader(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context,index){
                  return DrawerItemWidget(title: menus[index]['title'],
                      leadingIcon: menus[index]['leadingIcon'],
                      trailingIcon: menus[index]['trailingIcon'] ,
                      onAction: () {

Navigator.pop(context);
Navigator.pushNamed(context, menus[index]['route']);

                      });
                },
                separatorBuilder: (context,index){
                  return Divider(height: 6,);
                },
                itemCount: menus.length)
          )
                 ],
      ),
    );
  }
}
