// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:ssen_company/widget/analytics/graph1.dart';

// import '../../../services/theme/text_theme.dart';
// import '../../../utils/helper_function.dart';
// import '../../../widget/analytics/graph2.dart';



// class AnlayticsDesktop extends StatelessWidget {
//   const AnlayticsDesktop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     bool dark = SHelperFunction.isDarkMode(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Analaytics',
//           style: dark
//               ? STextTheme.darkTextTheme.headlineSmall
//               : STextTheme.lightTextTheme.headlineSmall,
//         ),
//         centerTitle: true,
//       ),
//       body:  SingleChildScrollView(
//         child: Column(
//           children: [
//             LineChartgraph(),
//             PercentIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }
