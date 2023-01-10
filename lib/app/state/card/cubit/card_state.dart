import 'package:equatable/equatable.dart';

class CardState extends Equatable {
  final bool useTshirtSizes;
  final String? selectedSize;
  final List<String> tShirtSizes = const ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  final List<String> taskSizes = const ['1', '2', '3', '5', '8', '13', '20', '40', '100', '∞'];

  const CardState({
    required this.useTshirtSizes,
    this.selectedSize,
  });

  //copy with
  CardState copyWith({
    bool? useTshirtSizes,
    String? selectedSize,
  }) =>
      CardState(
        useTshirtSizes: useTshirtSizes ?? this.useTshirtSizes,
        selectedSize: selectedSize,
      );

  @override
  List<Object?> get props => [useTshirtSizes, selectedSize];
}
