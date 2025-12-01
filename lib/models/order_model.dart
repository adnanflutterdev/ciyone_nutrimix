import 'package:ciyone_nutrimix/models/address_model.dart';
import 'package:ciyone_nutrimix/models/cart_model.dart';

class OrderModel {
  final String id;
  final List<CartModel> carts;
  final OrderStatus orderStatus;
  final String paymentMethod;
  final AddressModel address;

  OrderModel({
    required this.id,
    required this.carts,
    required this.orderStatus,
    required this.paymentMethod,
    required this.address,
  });

  factory OrderModel.fromJson(Map<String, dynamic> order) {
    return OrderModel(
      id: order['id'],
      carts: (order['carts'] as List<dynamic>)
          .map(
            (cartItem) => CartModel.fromJson(cartItem as Map<String, dynamic>),
          )
          .toList(),
      orderStatus: OrderStatus.fromJson(order['orderStatus']),
      paymentMethod: order['paymentMethod'],
      address: AddressModel.fromJson(order['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'carts': carts.map((cartItem)=> cartItem.toJson()).toList(),
      'orderStatus': orderStatus.toJson(),
      'paymentMethod': paymentMethod,
      'address': address.toJson(),
    };
  }
}

class OrderStatus {
  final String orderDate;
  final bool packaged;
  final bool shipped;
  final String deliveryDate;
  final bool delivered;
  final bool cancelled;

  OrderStatus({
    required this.orderDate,
    required this.packaged,
    required this.shipped,
    required this.deliveryDate,
    required this.delivered,
    required this.cancelled,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> orderStatus) {
    return OrderStatus(
      orderDate: orderStatus['orderDate'],
      packaged: orderStatus['packaged'],
      shipped: orderStatus['shipped'],
      deliveryDate: orderStatus['deliveryDate'],
      delivered: orderStatus['delivered'],
      cancelled: orderStatus['cancelled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderDate': orderDate,
      'packaged': packaged,
      'shipped': shipped,
      'deliveryDate': deliveryDate,
      'delivered': delivered,
      'cancelled': cancelled,
    };
  }
}
