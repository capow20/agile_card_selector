import 'package:agile_card_selector/app/state/card/cubit/card_cubit.dart';
import 'package:agile_card_selector/views/card_selector_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AgileCardSelectorApp());
}

class AgileCardSelectorApp extends StatelessWidget {
  const AgileCardSelectorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const CardSelectorView(),
        },
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: const Color.fromRGBO(33, 39, 58, 1),
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color.fromRGBO(255, 0, 73, 1),
            onPrimary: Color.fromRGBO(215, 221, 237, 1),
            secondary: Color.fromRGBO(63, 136, 197, 1),
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Color.fromRGBO(32, 40, 56, 1),
            onBackground: Colors.white,
            surface: Color.fromRGBO(43, 50, 70, 1),
            onSurface: Colors.white,
            tertiary: Color.fromRGBO(237, 172, 98, 1),
          ),
        ),
      ),
    );
  }
}
