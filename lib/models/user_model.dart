import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String dob;

  final int addressIndex;
  final List<AddressModel> address;
  final List<String> wishList;
  final List<CartModel> cart;
  final List<String> myOrders;

  UserModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.gender = '',
    this.dob = '',
    this.address = const [],
    this.addressIndex = -1,
    this.wishList = const [],
    this.cart = const [],
    this.myOrders = const [],
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? dob,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
    );
  }

  factory UserModel.fromJson(Map<String,dynamic> user) {
    return UserModel(
      name: user['name'],
      email: user['email'],
      phone: user['phone'],
      gender: user['gender'],
      dob: user['dob'],
      addressIndex: user['addressIndex'],
      address: (user['address'] as List<dynamic>)
          .map(
            (address) => AddressModel.fromJson(address as Map<String, dynamic>),
          )
          .toList(),
      wishList: (user['wishlist'] as List<dynamic>).map((e)=> e.toString()).toList(),
      myOrders: (user['myOrders'] as List<dynamic>).map((e)=> e.toString()).toList(),
      cart: (user['cart'] as List<dynamic>)
          .map((cart) => CartModel.fromJson(Map<String,dynamic>.from(cart)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'dob': dob,
      'addressIndex': addressIndex,
      'address': address.map((add) => add.toJson()).toList(),
      'wishlist': wishList,
      'myOrders': myOrders,
      'cart': cart.map((cartItem) => cartItem.toJson()).toList(),
    };
  }
}
