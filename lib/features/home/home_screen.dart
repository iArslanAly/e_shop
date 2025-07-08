import 'package:e_shop/common/widgets/customShapes/containers/primery_hader_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [EPrimeryHeeader(child: Column())]),
      ),
    );
  }
}
