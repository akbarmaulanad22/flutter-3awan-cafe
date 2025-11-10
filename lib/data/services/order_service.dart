import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/menu.dart';

class OrderService {
  final String baseUrl =
      "https://flask-3awan-cafe-api-production.up.railway.app";

  Future<bool> createOrder(Map<Menu, int> cartItems) async {
    final List<Map<String, dynamic>> items = cartItems.entries
        .map((e) => {"menuId": e.key.id, "quantity": e.value})
        .toList();

    final res = await http.post(
      Uri.parse("$baseUrl/orders"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"items": items}),
    );

    return res.statusCode == 201;
  }

  Future<List<dynamic>> fetchOrders() async {
    final res = await http.get(Uri.parse("$baseUrl/orders"));
    if (res.statusCode != 200) return [];
    return jsonDecode(res.body);
  }
}
