import 'package:flutter/material.dart';
import 'package:gym/config/theme/app_theme.dart';


class LiveTrackingScreen extends StatelessWidget {
  const LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.dark(),
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration:
                                const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 6),
                          const Text('CONNECTED',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.success)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: const [
                        Icon(Icons.battery_full_rounded, color: Colors.white70, size: 18),
                        SizedBox(width: 4),
                        Text('85%', style: TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text('12:23',
                    style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w300)),
                const SizedBox(height: 4),
                const Text('DURACIÓN TOTAL',
                    style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12, letterSpacing: 1)),
                const Spacer(),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(Icons.favorite_rounded, color: AppColors.danger, size: 46),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: const [
                    Text('143',
                        style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold)),
                    SizedBox(width: 6),
                    Text('BPM', style: TextStyle(color: Colors.white70, fontSize: 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.show_chart_rounded, color: AppColors.primary, size: 16),
                    SizedBox(width: 4),
                    Text('Ritmo constante', style: TextStyle(color: AppColors.primary, fontSize: 13)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: _watchStat(Icons.directions_walk_rounded, AppColors.info, '4,281', 'PASOS'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _watchStat(Icons.bolt_rounded, AppColors.primary, '98%', 'SPO2'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _watchStat(
                          Icons.local_fire_department_rounded, AppColors.warning, '342', 'KCAL'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 76,
                        height: 76,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.pause_rounded, color: Colors.black, size: 32),
                      ),
                    ),
                    const Positioned(
                      right: -50,
                      child: Icon(Icons.bolt_rounded, color: AppColors.primary, size: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.darkSurface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.darkBorder),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.tv_rounded, size: 15, color: AppColors.primary),
                      SizedBox(width: 8),
                      Text('SINCRONIZADO CON TV SALA 1',
                          style: TextStyle(
                              color: AppColors.primary, fontSize: 11.5, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _watchStat(IconData icon, Color color, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Column(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 10)),
        ],
      ),
    );
  }
}