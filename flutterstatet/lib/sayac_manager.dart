import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstatet/model/sayac_model.dart';

final sayacNotifierProvider =
    StateNotifierProvider<SayacManager, SayacModel>(((ref) {
  return SayacManager();
}));

class SayacManager extends StateNotifier<SayacModel> {
  SayacManager() : super(SayacModel(0));

  void arttir() {
    var oankiSayacDegeri = state.sayac;
    state = SayacModel(oankiSayacDegeri + 1);
  }

  void azalt() {
    var oankiSayacDegeri = state.sayac;
    state = SayacModel(oankiSayacDegeri - 1);
  }
}
