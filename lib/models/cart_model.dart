class CartModel {
  final String productId;
  final int quantity;

  CartModel({required this.productId, required this.quantity});

  factory CartModel.fromJson(Map<String,dynamic> cart) {
    return CartModel(productId: cart['productId'], quantity: cart['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
