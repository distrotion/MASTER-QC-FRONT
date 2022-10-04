import 'package:flutter/material.dart';

import '05INSPECTIONstd/INSPECTIONstdMAIN.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5Body();
  }
}

class Page5Body extends StatelessWidget {
  const Page5Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: INSPECTIONstdMAIN(),
    );
  }
}
