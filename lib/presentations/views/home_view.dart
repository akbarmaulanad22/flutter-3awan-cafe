import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import 'widgets/menu_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(context),
              const SizedBox(height: 12),
              _searchBar(vm),
              const SizedBox(height: 18),

              // ✅ IF SEARCH → Full Large List
              if (vm.searchQuery.isNotEmpty) ...[
                const Text(
                  'Search Results',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                Expanded(child: _largeList(vm)),
              ] else ...[
                const Text(
                  'Your trusted picks',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                _trustedPicks(vm),
                const SizedBox(height: 18),
                const Text(
                  'Recommended',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                Expanded(child: _largeList(vm)),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomNav(context),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            '15 Water Street Fremont',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/cart'),
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }

  Widget _searchBar(HomeViewModel vm) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
              ),
              onChanged: vm.setSearch,
            ),
          ),
        ],
      ),
    );
  }

  Widget _trustedPicks(HomeViewModel vm) {
    final items = vm.menuBestSellers.take(2).toList();
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final m = items[index];
          return MenuCard.small(menu: m);
        },
      ),
    );
  }

  Widget _largeList(HomeViewModel vm) {
    final items = vm.menus;
    if (vm.isLoading) return const Center(child: CircularProgressIndicator());

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final m = items[index];
        return MenuCard.large(menu: m);
      },
    );
  }

  Widget _bottomNav(BuildContext context) {
    return Container(
      height: 78,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            child: const _NavItem(
              icon: Icons.home_filled,
              label: 'Home',
              active: true,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/orders'),
            child: const _NavItem(icon: Icons.receipt_long, label: 'My Order'),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profile'),
            child: const _NavItem(icon: Icons.person_outline, label: 'Profile'),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _NavItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.orange : Colors.grey),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: active ? Colors.orange : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
