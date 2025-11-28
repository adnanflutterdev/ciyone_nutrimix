import 'package:ciyone_nutrimix/views/home/tabs/home_tab/wire_frame/build_product_row_wireframe.dart';
import 'package:ciyone_nutrimix/views/widgets/build_product_row.dart';
import 'package:flutter/material.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({
    super.key,
    required this.titles,
    this.isWireframe = false,
  });
  final List<String> titles;
  final bool isWireframe;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: titles.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return isWireframe
            ? const BuildProductRowWireframe()
            : BuildProductRow(title: titles[index]);
      },
    );
  }
}
