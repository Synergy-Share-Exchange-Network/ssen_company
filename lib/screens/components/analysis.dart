import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ssen_company/widget/analytics/graph1.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';
import '../../widget/analytics/graph2.dart';

class Anlaytics extends StatelessWidget {
  const Anlaytics({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analaytics',
          style: dark
              ? STextTheme.darkTextTheme.headlineSmall
              : STextTheme.lightTextTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            LineChartgraph(),
            PercentIndicator(),
          ],
        ),
      ),
    );
  }
}
