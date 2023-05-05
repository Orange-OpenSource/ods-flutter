import 'package:flutter/material.dart';

import '../_test_text_styles.dart';

class GuidelinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      body: SingleChildScrollView(child: TestTextStyles()),
    );
  }
}
