import 'dart:convert';
import 'package:task_5/data/UserService.dart';
import 'package:task_5/data/ProductsService.dart';
import 'package:task_5/presentation/models/ProductModel.dart';
import 'dio_config.dart';

Future<List<ProductModel>> getFavorites() async {
  var userId = getUserId();
  var response = await getHttpClient().get(
      "/favorites/$userId"
  );

  var favorites = jsonDecode(response.data);
  List<ProductModel> list = [];
  for (var productJson in favorites) {
    list.add(deserializeProduct(productJson));
  }

  return list;
}

void unlikeProduct(int productId) async {
  var userId = getUserId();
  await getHttpClient().delete(
      "/favorites/$userId/$productId"
  );
}

void likeProduct(int productId) async {
  var userId = getUserId();
  await getHttpClient().post(
      "/favorites/$userId",
      data: {
        'product_id': productId
      }
  );
}