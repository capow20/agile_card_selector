import 'package:agile_card_selector/app/state/card/cubit/card_cubit.dart';
import 'package:agile_card_selector/app/state/card/cubit/card_state.dart';
import 'package:agile_card_selector/widgets/atoms/agile_app_bar.dart';
import 'package:agile_card_selector/widgets/atoms/agile_card.dart';
import 'package:agile_card_selector/widgets/molecules/selected_agile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class CardSelectorView extends StatelessWidget {
  const CardSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardCubit, CardState>(
      builder: (context, state) {
        final sideLength = MediaQuery.of(context).size.width * 0.46512;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: AgileAppBar(
              title: state.useTshirtSizes ? "T-Shirt Sizes" : "Task Sizes",
              icon: state.useTshirtSizes ? FontAwesomeIcons.ruler : FontAwesomeIcons.shirt,
              onTap: () => context.read<CardCubit>().updateUseTshirtSizes(!state.useTshirtSizes),
              showSizeToggle: state.selectedSize == null,
            ),
          ),
          body: state.selectedSize == null
              ? Stack(
                  children: [
                    StackedCardCarousel(
                      spaceBetweenItems: sideLength,
                      items: state.useTshirtSizes
                          ? state.tShirtSizes
                              .map((e) => GestureDetector(
                                    onTap: () => context.read<CardCubit>().setSelectedSize(e),
                                    child: AgileCard(
                                      measurement: e,
                                      height: sideLength,
                                      width: sideLength,
                                    ),
                                  ))
                              .toList()
                          : state.taskSizes
                              .map((e) => GestureDetector(
                                    onTap: () => context.read<CardCubit>().setSelectedSize(e),
                                    child: AgileCard(
                                      measurement: e,
                                      height: sideLength,
                                      width: sideLength,
                                    ),
                                  ))
                              .toList(),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 40,
                    ),
                    SelectedAgileCard(
                      cardHeight: sideLength * 1.5,
                      cardWidth: sideLength * 1.5,
                      measurement: state.selectedSize!,
                    ),
                    const Spacer(),
                    SafeArea(child: IconButton(onPressed: () => context.read<CardCubit>().setSelectedSize(null), icon: const Icon(Icons.close)))
                  ],
                ),
        );
      },
    );
  }
}
