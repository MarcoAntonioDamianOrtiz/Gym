import 'package:flutter/material.dart';
import 'package:gym/config/theme/app_theme.dart';

class RoutineCard extends StatelessWidget {
  final String category;
  final String title;
  final String duration;
  final String kcal;
  final String difficulty;
  final List<IconData> syncIcons;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const RoutineCard({
    super.key,
    required this.category,
    required this.title,
    required this.duration,
    required this.kcal,
    required this.difficulty,
    required this.syncIcons,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded,
                          size: 14, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(duration,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textSecondary)),
                      const SizedBox(width: 12),
                      const Icon(Icons.local_fire_department_rounded,
                          size: 14, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(kcal,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textSecondary)),
                      const Spacer(),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Text(difficulty, style: const TextStyle(fontSize: 11)),
                      ),
                    ],
                  ),
                  const Divider(height: 22),
                  Row(
                    children: [
                      const Text('SYNC: ',
                          style: TextStyle(
                              fontSize: 11, color: AppColors.textSecondary)),
                      for (final icon in syncIcons)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(icon, size: 15, color: AppColors.textPrimary),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}