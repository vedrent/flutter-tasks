import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:task_5/data/UserService.dart';
import 'package:task_5/data/ProductsService.dart';
import 'package:task_5/presentation/models/OrderModel.dart';
import 'package:task_5/presentation/models/ProductModel.dart';
import 'package:task_5/presentation/models/CartItemModel.dart';
import 'dio_config.dart';

Future<List<OrderModel>> getOrders() async {
  var userId = getUserId();
  var result = await getHttpClient().get("/orders/$userId");

  List<OrderModel> orders = [];

  for (var order in jsonDecode(result.data)) {
    orders.add(deserializeOrder(order));
  }
  return orders;
}

Future<void> createOrder(OrderModel order, List<CartItemModel> items) async {
  var userId = getUserId();
  await getHttpClient().post(
      "/orders/$userId",
      data: serializeOrder(order, items, userId!)
  );
}

Future<List<ProductModel>> getOrderItems(OrderModel order) async {
  final response = await getHttpClient().get(
      "/orders/$userId/${order.id}"
  );
  var products = jsonDecode(response.data);
  List<ProductModel> list = [];
  for (var product in products) {
    var deserialized = deserializeProduct(product);
    list.add(deserialized);
  }
  return list;
}

OrderModel deserializeOrder(dynamic json) {
  return OrderModel(
      json['order_id'],
      json['user_id'],
      double.parse(json['total'].toString()),
      json['status'],
      json['created_at']
  );
}

dynamic serializeOrder(OrderModel order, List<CartItemModel> items, String userId) {
  final request = {
    'order_id': null,
    'user_id': userId,
    'total': order.total,
    'status': order.status,
    'created_at': null,
    'products': items
  };
  debugPrint(request.toString());
  // print(request);
  return request;
}