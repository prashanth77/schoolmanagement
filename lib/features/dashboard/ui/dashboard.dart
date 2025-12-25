  import 'package:flutter/material.dart';
  import 'package:go_router/go_router.dart';

  import 'package:flutter/material.dart';
  import 'package:go_router/go_router.dart';

  import 'package:flutter/material.dart';
  import 'package:go_router/go_router.dart';

  class DashboardLayout extends StatefulWidget {
    final Widget child;

    const DashboardLayout({
      super.key,
      required this.child,
    });

    @override
    State<DashboardLayout> createState() => _DashboardLayoutState();
  }

  class _DashboardLayoutState extends State<DashboardLayout> {
    bool isExpanded = true;
    int selectedIndex = 0;

    @override
    Widget build(BuildContext context) {
      final location = GoRouterState.of(context).uri.toString();

      // ✅ Sync sidebar selection with route
      selectedIndex = location == '/'
          ? 0
          : location.startsWith('/students')
          ? 1
          : location.startsWith('/faculty')
          ? 2
          : 0;

      final appBarTitle = _getTitle(location);

      return Scaffold(
        backgroundColor: Colors.grey.shade100,

        // ✅ APP BAR
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          title: Text(
            appBarTitle,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.indigo),
            ),
            const SizedBox(width: 16),
          ],
        ),

        // ✅ BODY
        body: Row(
          children: [
            _buildSidebar(context),
            const VerticalDivider(width: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: widget.child, // 👈 GoRouter content
              ),
            ),
          ],
        ),
      );
    }

    // ================= APP BAR TITLE =================

    String _getTitle(String location) {
      if (location == '/') return 'Dashboard';
      if (location.startsWith('/students')) return 'Students';
      if (location.startsWith('/faculty')) return 'Faculty';
      return 'School Management';
    }

    // ================= SIDEBAR =================

    Widget _buildSidebar(BuildContext context) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isExpanded ? 220 : 72,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 8),

            IconButton(
              icon: Icon(isExpanded ? Icons.menu_open : Icons.menu),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),

            const SizedBox(height: 12),

            _navItem(
              icon: Icons.dashboard,
              label: 'Dashboard',
              index: 0,
              onTap: () => context.go('/'),
            ),

            _navItem(
              icon: Icons.people,
              label: 'Students',
              index: 1,
              onTap: () => context.go('/students'),
            ),

            _navItem(
              icon: Icons.school,
              label: 'Faculty',
              index: 2,
              onTap: () => context.go('/faculty'),
            ),
          ],
        ),
      );
    }

    // ================= NAV ITEM =================

    Widget _navItem({
      required IconData icon,
      required String label,
      required int index,
      required VoidCallback onTap,
    }) {
      final bool isSelected = selectedIndex == index;

      return InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.indigo.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.indigo : Colors.grey,
              ),
              if (isExpanded) ...[
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? Colors.indigo : Colors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }
  }

