class CartModel {
  final String docId;
  final int quantity;
  final String productId;
  final int varientIndex;

  CartModel({
    required this.docId,
    required this.productId,
    required this.quantity,
    required this.varientIndex,
  });

  CartModel copyWith({int? quantity, int? varientIndex}) {
    return CartModel(
      docId: docId,
      productId: productId,
      quantity: quantity ?? this.quantity,
      varientIndex: varientIndex ?? this.varientIndex,
    );
  }

  factory CartModel.fromJson(Map<String, dynamic> cart) {
    return CartModel(
      docId: cart['docId'],
      productId: cart['productId'],
      quantity: cart['quantity'],
      varientIndex: cart['varientIndex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'productId': productId,
      'quantity': quantity,
      'varientIndex': varientIndex,
    };
  }
}
