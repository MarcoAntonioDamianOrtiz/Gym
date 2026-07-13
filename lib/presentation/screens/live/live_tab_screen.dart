import 'package:flutter/material.dart';
import 'package:gym/config/theme/app_theme.dart';
import 'package:gym/presentation/screens/session/live_tracking_screen.dart';

class LiveTabScreen extends StatelessWidget {
  const LiveTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('En Vivo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bolt_rounded, size: 56, color: AppColors.primary),
            const SizedBox(height: 16),
            const Text(
              'No tienes una sesión activa',
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LiveTrackingScreen()),
                );
              },
              child: const Text('Iniciar sesión en vivo'),
            ),
          ],
        ),
      ),
    );
  }
}