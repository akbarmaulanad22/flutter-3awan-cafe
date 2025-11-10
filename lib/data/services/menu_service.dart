import 'dart:convert';
import 'package:flutter3awancafe/data/models/menu.dart';
import 'package:http/http.dart' as http;

class MenuService {
  final String baseUrl =
      "https://flask-3awan-cafe-api-production.up.railway.app/"; // endpoint API (JSON)
  Future<List<Menu>> fetchMenus() async {
    final res = await http.get(Uri.parse("$baseUrl/menus"));
    if (res.statusCode != 200) return [];
    final List data = json.decode(res.body);
    return data.map((e) => Menu.fromJson(e)).toList();
  }
}
