import 'package:flutter/material.dart';
import 'package:gym/config/presentation/screen/chat/Chat_screen.dart';
import 'package:gym/config/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemes(selectedColor: 4);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme(),
      home: const ChatScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String texto = "Bienvenido al gym";

  void cambiarTexto() {
    setState(() {
      texto = "Boton presionado";
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gym App"),

        backgroundColor: colors.primary,

        foregroundColor: colors.onPrimary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texto, style: TextStyle(fontSize: 24, color: colors.primary)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: cambiarTexto,
              child: const Text("Presionar"),
            ),
          ],
        ),
      ),
    );
  }
}
