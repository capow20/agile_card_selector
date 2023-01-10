import 'package:agile_card_selector/app/state/card/cubit/card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgileCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const AgileCard({Key? key, required this.measurement, this.height, this.width, this.child}) : super(key: key);
  final String measurement;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 200,
        height: height ?? 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            child ??
                Center(
                    child: Text(
                  measurement,
                  style: TextStyle(fontSize: context.read<CardCubit>().state.selectedSize == null ? 18 : 25),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
