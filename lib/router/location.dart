import 'package:app_v2/input/category_input_screen.dart';
import 'package:app_v2/input/input_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app_v2/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:app_v2/states/category_notifier.dart';

//비머 홈로케이션 클래스 생성(인스턴스)
class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state){
    return [BeamPage(child: HomeScreen(), key: ValueKey('home'))];
  }

  @override
  List get pathBlueprints => ['/'];
}

class InputLocation extends BeamLocation {
  @override
  Widget builder(BuildContext context, Widget navigator) {
    return ChangeNotifierProvider.value(
        value: categoryNotifier,
        child: super.builder(context, navigator));
  }

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state){
    return [
      ...HomeLocation().buildPages(context, state),
      if(state.pathBlueprintSegments.contains('input'))
      BeamPage(
        child: InputScreen(),
        key: ValueKey('input')

    ),
      if(state.pathBlueprintSegments.contains('category_input'))
        BeamPage(
            child: CategoryInputScreen(),
            key: ValueKey('category_input')

        ),
    ];
  }

  @override
  List get pathBlueprints => ['/input', '/input/category_input'];

}