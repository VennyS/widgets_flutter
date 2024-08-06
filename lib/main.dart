// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:widgets/theme.dart';
import 'package:widgets/toast.dart';
import 'code_form.dart';
import 'custom_tag.dart';
import 'custom_button.dart';
import 'universal_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: BlueTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Виджеты'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final GlobalKey<ToastWidgetState> toastKey = GlobalKey<ToastWidgetState>();
  final String title;
  final String dotSvgPath = "assets/svgs/dot.svg";
  final String playSvgPath = "assets/svgs/play.svg";

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
              // allWidgets(context),
              ToastWidget(
                key: toastKey,
                onTapClose: onTapClose,
                variant: ToastVariant.informative,
                title: "Title",
                description: "Description. Lorem ipsum\n dolor sit amet.",
                showTitle: true,
                showDescription: true,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void onTapClose() {
    toastKey.currentState?.hideToast();
  }

  Widget allWidgets(BuildContext context) {
    return Column(
      children: [
        CodeInputWidget(
          onCodeEntered: (code) => print('Entered code: $code'),
        ),
        const SizedBox(
          height: 24,
        ),
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
        CustomButtonWidget(
          onPressed: () => print("Primary click"),
          variant: CustomButtonVariants.primary,
          text: "Button",
          leftSvg: SvgPicture.asset(dotSvgPath,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          showLeftSvg: true,
          rightSvg: SvgPicture.asset(dotSvgPath,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          showRightSvg: true,
        ),
        const SizedBox(height: 24),
        CustomButtonWidget(
          onPressed: () => print("Secondary click"),
          variant: CustomButtonVariants.secondary,
          text: "Button",
        ),
        const SizedBox(height: 24),
        CustomButtonWidget(
          onPressed: () => print("Terciary click"),
          variant: CustomButtonVariants.terciary,
          text: "Button",
        ),
        const SizedBox(height: 24),
        CustomTag(
          text: "Tag",
          leftSvg: SvgPicture.asset(playSvgPath,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor, BlendMode.srcIn)),
          showLeftSvg: true,
          rightSvg: SvgPicture.asset(dotSvgPath,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor, BlendMode.srcIn)),
          showRightSvg: true,
        ),
      ],
    );
  }
}
