import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>(((ref) => "Riverpod Basics"));
final textProvider = Provider<String>(((ref) {
  return "Butona basilma sayisi :";
}));

final sayacStateProvider = StateProvider<int>((ref) {
  return 0;
});
