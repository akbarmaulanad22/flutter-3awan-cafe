import 'package:flutter/material.dart';
import '../../data/models/menu.dart';
import '../../data/services/menu_service.dart';

class HomeViewModel extends ChangeNotifier {
  final MenuService _api = MenuService();

  List<Menu> _menus = [];
  bool _isLoading = false;
  String _searchQuery = '';

  List<Menu> get menus => _searchQuery.isEmpty
      ? _menus
      : _menus
            .where(
              (m) => m.title.toLowerCase().contains(_searchQuery.toLowerCase()),
            )
            .toList();

  List<Menu> get menuBestSellers => _menus;

  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery; // <- getter yang HomeView panggil
  bool get isSearching => _searchQuery.isNotEmpty;

  HomeViewModel() {
    fetch();
  }

  Future<void> fetch() async {
    _isLoading = true;
    notifyListeners();

    try {
      _menus = await _api.fetchMenus();
    } catch (e) {
      _menus = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void setSearch(String value) {
    _searchQuery = value;
    notifyListeners();
  }
}
