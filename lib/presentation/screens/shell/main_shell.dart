import 'package:flutter/material.dart';
import 'package:gym/config/theme/app_theme.dart';
import 'package:gym/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:gym/presentation/screens/routines/routines_screen.dart';
import 'package:gym/presentation/screens/live/live_tab_screen.dart';
import 'package:gym/presentation/screens/shared/placeholder_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    RoutinesScreen(),
    LiveTabScreen(),
    PlaceholderScreen(title: 'Historial', icon: Icons.calendar_month_rounded),
    PlaceholderScreen(title: 'Perfil', icon: Icons.person_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Inicio',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_rounded),
            label: 'Rutinas',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: const Text('6'),
              backgroundColor: AppColors.danger,
              child: const Icon(Icons.bolt_rounded),
            ),
            label: 'En Vivo',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Historial',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}