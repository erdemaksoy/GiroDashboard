import 'package:flutter/material.dart';

import '../responssive/responsive .dart';

class AnalyticCards extends StatelessWidget {
  const AnalyticCards({super.key, required this.item});
  final List<dynamic> item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Responsive(
        mobile: AnalyticInfoCardGridView(
          item: item,
          crossAxisCount: size.width < 650 ? 1 : 2,
          childAspectRatio: size.width < 650 ? 3 : 3,
        ),
        tablet: AnalyticInfoCardGridView(item: item),
        desktop: AnalyticInfoCardGridView(
          item: item,
          childAspectRatio: size.width < 650 ? 1.5 : 2.1,
        ),
      ),
    );
  }
}

class AnalyticInfoCardGridView extends StatelessWidget {
  AnalyticInfoCardGridView({
    required this.item,
    super.key,
    this.crossAxisCount = 1,
    this.childAspectRatio = 3,
  });

  final int crossAxisCount;
  final double childAspectRatio;
  List<dynamic> item;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: item.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) => item[index]);
  }
}
