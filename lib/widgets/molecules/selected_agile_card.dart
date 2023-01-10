import 'package:agile_card_selector/widgets/atoms/agile_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/state/card/cubit/card_cubit.dart';

class SelectedAgileCard extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;
  final String measurement;
  const SelectedAgileCard({super.key, required this.cardHeight, required this.cardWidth, required this.measurement});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      back: AgileCard(
        measurement: measurement,
        height: cardHeight,
        width: cardWidth,
        child: Center(
          child: Text(
            measurement,
            style: TextStyle(fontSize: context.read<CardCubit>().state.selectedSize == null ? 18 : 25),
          ),
        ),
      ),
      front: AgileCard(
        measurement: measurement,
        height: cardHeight,
        width: cardWidth,
        child: Center(
            child: Image.asset(
          "assets/AgileCardsIcon.png",
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
