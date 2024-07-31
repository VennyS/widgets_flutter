import 'package:flutter/material.dart';
import 'custom_tag.dart';
import 'custom_button.dart';
import 'universal_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006FFD)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Виджеты'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              UniversalButton(
                id: 12,
                title: "Заголовок, максимум 2 строк",
                desc: "Описание краткое, максимум 3-4 строчки",
                state: UniversalButtonState.skeleton,
                onPressed: () => print("Skeleton click"),
              ),
              const SizedBox(height: 24),
              UniversalButton(
                id: 12,
                title: "Заголовок, максимум 2 строк",
                desc: "Описание краткое, максимум 3-4 строчки",
                state: UniversalButtonState.active,
                onPressed: () => print("Active click"),
              ),
              const SizedBox(height: 24),
              UniversalButton(
                id: 12,
                title: "Заголовок, максимум 2 строк",
                desc: "Описание краткое, максимум 3-4 строчки",
                state: UniversalButtonState.highlight,
                onPressed: () => print("Highlight click"),
              ),
              const SizedBox(height: 24),
              const CustomButton(
                variant: CustomButtonVariants.primary,
                text: "Click me",
              ),
              const SizedBox(height: 24),
              const CustomButton(
                variant: CustomButtonVariants.secondary,
                text: "Click me",
              ),
              const SizedBox(height: 24),
              const CustomButton(
                variant: CustomButtonVariants.terciary,
                text: "Click me",
              ),
              const SizedBox(height: 24),
              const CustomTag(text: "Tag"),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
