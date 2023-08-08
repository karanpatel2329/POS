import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/constants/image_path.dart';
import 'package:pos_app/core/size_config.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => SalesScreenState();
}

class SalesScreenState extends State<SalesScreen> {

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  late List<_ChartData2> data2;
  late TooltipBehavior _tooltip2;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
 
  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];

    data2 = [
      _ChartData2('CHN', 5),
      _ChartData2('GER', 10),
      _ChartData2('RUS', 55),
      _ChartData2('BRZ', 2.4),
      _ChartData2('IND', 28)
    ];
    _tooltip = TooltipBehavior(enable: true);
    _tooltip2 = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      // Initial Selected Value
  String dropdownvalue = 'Daily';

  // List of items in our dropdown menu
  var items = [
    'Daily',
    '4',
    '6',
  ];

    return Scaffold(
      key: _key,

      // App Bar Content

     appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: InkWell(
          onTap: (){Get.back();},
          child: const Icon(Icons.arrow_back)),
        title: Text('Sales', style: AppTextStyle.black40420W600,),
        centerTitle: true,
      ),

      // Body Content

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Sales Report', style: AppTextStyle.black40414W600,),

                    // DropDown
                    Container(
                      height: 30,
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: orange, style: BorderStyle.solid, width: 0.80),
                      ),
                      child: DropdownButton(
                        hint: Text('Select seater'),
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        value: dropdownvalue,
                        isDense: true,
                        isExpanded: true,
                        underline: const SizedBox(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: orange,
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: AppTextStyle.black40416W400,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),

                  ],
                ),
        
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),

                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: lightOrange
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(ImagePath.totalRevenueIcon),
                        SizedBox(
                          width: 8 * (SizeConfig.widthMultiplier ?? 1),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total revenue', style: AppTextStyle.black40412W400,),
                            SizedBox(
                              height: 4 * (SizeConfig.heightMultiplier ?? 1),
                            ),
                            Text('₹40,239.00', style: AppTextStyle.black40416W600,),
                          ],
                        ),
                      ],
                    ),
                  );
                  }
                ),

                SizedBox(
                  height: 8 * (SizeConfig.heightMultiplier ?? 1),
                ),

                // Chart

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: lightOrange),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
                              tooltipBehavior: _tooltip,
                              series: <ChartSeries<_ChartData, String>>[
                                ColumnSeries<_ChartData, String>(
                                    dataSource: data,
                                    xValueMapper: (_ChartData data, _) => data.x,
                                    yValueMapper: (_ChartData data, _) => data.y,
                                    name: 'Gold',
                                    color: orange,
                                  )
                              ]
                            ),
                          ),
                          Container(
                            height: 1,
                            color: lightOrange,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
                              tooltipBehavior: _tooltip2,
                              series: <ChartSeries<_ChartData2, String>>[
                                ColumnSeries<_ChartData2, String>(
                                    dataSource: data2,
                                    xValueMapper: (_ChartData2 data, _) => data.x,
                                    yValueMapper: (_ChartData2 data, _) => data.y,
                                    name: 'Gold',
                                    color: orange
                                  )
                              ]
                            ),
                          ),
                          
                        ],
                      ),
                    )
              ],
            ),
          )
        ),
      ),

      
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
 
  final String x;
  final double y;
}

class _ChartData2 {
  _ChartData2(this.x, this.y);
 
  final String x;
  final double y;
}