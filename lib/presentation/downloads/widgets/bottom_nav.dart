import 'package:flutter/material.dart';

ValueNotifier<int>indexchangenotifier=ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexchangenotifier, builder:(context,int newindex,_) {
     return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      currentIndex: newindex,
      onTap: (index) {
      indexchangenotifier.value=index;  
      },
      elevation: 30,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      items:const [BottomNavigationBarItem(
      icon: Icon(
      Icons.home),
      label:'Home'),BottomNavigationBarItem(
      icon: Icon(
      Icons.collections),
      label:'New & hot'),BottomNavigationBarItem(
      icon: Icon(
      Icons.emoji_emotions),
      label:'Fast Laughs'),BottomNavigationBarItem(
      icon: Icon(
      Icons.search),
      label:'Search'),BottomNavigationBarItem(
      icon: Icon(
      Icons.download),
      label:'Downloads')]);
    },);
  }
}