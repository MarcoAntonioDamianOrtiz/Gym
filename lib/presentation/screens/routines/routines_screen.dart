import 'package:flutter/material.dart';
import 'package:gym/config/theme/app_theme.dart';
import 'package:gym/presentation/widgets/routine_card.dart';
import 'package:gym/presentation/screens/session/session_screen.dart';

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  String _selectedFilter = 'Todos';
  final List<String> _filters = ['Todos', 'Fuerza', 'Cardio', 'Yoga', 'HIIT'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration:
                  BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 10),
            const Text('Rutinas'),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search_rounded), onPressed: () {}),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 16,
              backgroundImage:
                  NetworkImage('https://avatars.githubusercontent.com/u/145174331?v=4'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _buildFilters(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('MIS RUTINAS',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.5)),
              Text('Ver Todo', style: TextStyle(fontSize: 13, color: AppColors.primary)),
            ],
          ),
          const SizedBox(height: 12),
          RoutineCard(
            category: 'HIIT',
            title: 'HIIT Explosivo Matutino',
            duration: '25 min',
            kcal: '320 kcal',
            difficulty: 'Avanzado',
            syncIcons: const [
              Icons.smartphone_rounded,
              Icons.watch_rounded,
              Icons.tv_rounded,
            ],
            gradientColors: const [Color(0xFF334155), Color(0xFF0F172A)],
            onTap: () => _openSession(context, 'HIIT Explosivo Matutino'),
          ),
          const SizedBox(height: 14),
          RoutineCard(
            category: 'Yoga',
            title: 'Yoga de Recuperación',
            duration: '40 min',
            kcal: '150 kcal',
            difficulty: 'Principiante',
            syncIcons: const [Icons.smartphone_rounded, Icons.tv_rounded],
            gradientColors: const [Color(0xFFFDA4AF), Color(0xFFFB923C)],
            onTap: () => _openSession(context, 'Yoga de Recuperación'),
          ),
          const SizedBox(height: 14),
          RoutineCard(
            category: 'Fuerza',
            title: 'Fuerza de Cuerpo Completo',
            duration: '45 min',
            kcal: '410 kcal',
            difficulty: 'Intermedio',
            syncIcons: const [Icons.smartphone_rounded, Icons.watch_rounded],
            gradientColors: const [Color(0xFF94A3B8), Color(0xFF475569)],
            onTap: () => _openSession(context, 'Fuerza de Cuerpo Completo'),
          ),
          const SizedBox(height: 20),
          _buildAiSuggestion(),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final selected = filter == _selectedFilter;
          return ChoiceChip(
            label: Text(filter),
            selected: selected,
            onSelected: (_) => setState(() => _selectedFilter = filter),
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.surface,
            labelStyle: TextStyle(
              color: selected ? Colors.white : AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            side: BorderSide(color: selected ? AppColors.primary : AppColors.border),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
      ),
    );
  }

  Widget _buildAiSuggestion() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('SUGERENCIA AI',
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
          const SizedBox(height: 6),
          const Text('Optimiza tu recuperación',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          const SizedBox(height: 4),
          const Text(
            'Basado en tu última sesión de HIIT, te sugerimos 15 min de Yoga.',
            style: TextStyle(fontSize: 12.5, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {},
            child: const Text('Añadir a biblioteca'),
          ),
        ],
      ),
    );
  }

  void _openSession(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SessionScreen(routineName: title)),
    );
  }
}