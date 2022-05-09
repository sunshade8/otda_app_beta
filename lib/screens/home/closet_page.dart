import 'package:app_v2/widget/expandablefab.dart';
import 'package:beamer/src/beamer.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';


class ClosetPage extends StatelessWidget {
  const ClosetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 90,
        children: [
          MaterialButton(
            onPressed: (){
              context.beamToNamed('input');
            },
            shape: CircleBorder(),
            height: 40,
            color: Theme.of(context).colorScheme.primary,
            child: Icon(Icons.add),
          ),
          MaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            height: 40,
            color: Theme.of(context).colorScheme.primary,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
