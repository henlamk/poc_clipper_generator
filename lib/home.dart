import 'package:flutter/material.dart';

import 'clip_generator.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: ClipGenerator().generateRandom(
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}
