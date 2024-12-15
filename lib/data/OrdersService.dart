import 'dart:convert';
import 'package:task_5/data/UserService.dart';
import 'package:task_5/presentation/models/OrderModel.dart';
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

Future<void> createOrder(OrderModel order) async {
  var userId = getUserId();
  var result = await getHttpClient().post(
      "/orders/$userId",
      data: serializeOrder(order, userId!)
  );
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

dynamic serializeOrder(OrderModel order, String userId) {
  return {
    'order_id': null,
    'user_id': userId,
    'total': order.total,
    'status': order.status,
    'created_at': null
  };
}