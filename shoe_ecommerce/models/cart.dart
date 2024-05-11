import 'package:e_commerce_app_2/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'blue shoes',
      price: '123',
      imagePath: 'lib/images/shoe1.jpeg',
      description: 'the blue motherf***s',
    ),
    Shoe(
      name: 'black and white',
      price: '234',
      imagePath: 'lib/images/shoe2.png',
      description: 'BNW but for the vibrant folks',
    ),
    Shoe(
      name: 'cream daddy',
      price: '456',
      imagePath: 'lib/images/shoe4.png',
      description: "it's creamalicious",
    ),
    Shoe(
      name: 'Night Light',
      price: '345',
      imagePath: 'lib/images/shoe6.png',
      description: 'glowing in the dark',
    ),
  ];

  //lsit of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
