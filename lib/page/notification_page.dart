import 'package:bottom_nav_bar/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Notification"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              colors: [Colors.red, Colors.pink],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            )
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false).incrementNotificationCounter();
              },
              color: Colors.green,
              pressedOpacity: 0.8,
              child: const Text("Increment"), 
            ), 
      
            const SizedBox(height: 20,),
      
            CupertinoButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false).decrementNotificationCounter();
              },
              color: Colors.green,
              pressedOpacity: 0.8,
              child: const Text("Decrement"), 
            ),
          ],
        ),
      )
    );
  }
}