import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstatet/sayac_manager.dart';

import 'model/sayac_model.dart';

final titleProvider = Provider<String>(((ref) => "Riverpod Basics"));
final titleProvider2 =
    Provider<String>(((ref) => "Riverpod StateNotifierProvider"));

final textProvider = Provider<String>(((ref) {
  return "Butona basilma sayisi :";
}));

final sayacStateProvider = StateProvider<int>((ref) {
  return 0;
});

final sayacNotifierProvider =
    StateNotifierProvider<SayacManager, SayacModel>(((ref) {
  return SayacManager();
}));

final ciftMiprovider = Provider<bool>(((ref) {
  var sayacModel = ref.watch(sayacNotifierProvider);
  //
  // if (sayacModel.sayacDegeri % 2 == 0) {
  //   return true;
  // } else {
  //   return false;
  // }
//yuxaridaki kodun qisa yoludur

  return sayacModel.sayacDegeri % 2 == 0;
}));
