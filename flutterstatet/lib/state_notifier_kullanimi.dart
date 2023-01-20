import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstatet/all_providers.dart';

class StateNotifierKullanimi extends StatelessWidget {
  const StateNotifierKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Consumer(builder: ((context, ref, child) {
            var title = ref.watch(titleProvider2);
            return Text(title);
          })),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[MyText(), MyCounterText(), CiftMiWidget()],
          ),
        ),
        floatingActionButton: const MyFloatingActionButton());
  }
}

class CiftMiWidget extends ConsumerWidget {
  const CiftMiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("ciftmi widget tetiklendi");
    var ciftMi = ref.watch(ciftMiprovider);
    return Text(ciftMi ? "Cift" : "Tek");
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("myCountertext build tetiklendi");
    var sayac = ref.watch(sayacNotifierProvider);
    return Text(
      sayac.sayacDegeri.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var text = ref.watch(textProvider);
    return Text(ref.watch(textProvider));
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(sayacNotifierProvider.notifier).arttir();
// old version 2.0
        // ref.read(sayacStateProvider.state).state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
