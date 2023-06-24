import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int notification = 0;
  int cart = 0;
  int favourite = 0;

  void incrementNotificationCounter() {
    notification++;
    notifyListeners();
  }

  void decrementNotificationCounter() {
    if(notification <= 0){
      notification = 0;
    }
    else {
      notification--;
    }

    notifyListeners();
  }

  void incrementCartCounter() {
    cart++;
    notifyListeners();
  }

  void decrementCartCounter() {
    if(cart <= 0){
      cart = 0;
    }
    else {
      cart--;
    }
    notifyListeners();
  }

  void incrementfavouriteCounter() {
    favourite++;
    notifyListeners();
  }

  void decrementFavouriteCounter() {
    if(favourite <= 0){
      favourite = 0;
    }
    else {
      favourite--;
    }
    notifyListeners();
  }

}