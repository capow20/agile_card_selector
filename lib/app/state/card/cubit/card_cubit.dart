import 'package:agile_card_selector/app/state/card/cubit/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(const CardState(useTshirtSizes: false));

  void updateUseTshirtSizes(bool useShirtSizes) => emit(state.copyWith(useTshirtSizes: useShirtSizes));

  void setSelectedSize(String? selectedSize) => emit(state.copyWith(selectedSize: selectedSize));
}
