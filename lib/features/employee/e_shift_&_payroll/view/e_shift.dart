import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';
import 'package:pos_app/features/employee/e_start_duty/view/e_start_duty.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';


class EShiftScreen extends StatefulWidget {
  const EShiftScreen({super.key});

  @override
  State<EShiftScreen> createState() => EShiftScreenState();
}

class EShiftScreenState extends State<EShiftScreen> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,

      // App Bar Content

      appBar: AppBar(
        backgroundColor: white,
        scrolledUnderElevation: 0,
        title: Text('Shift', style: AppTextStyle.black40420W600,),
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

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: lightBlue
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Work starts from: ', style: AppTextStyle.black40416W400,),
                          SizedBox(
                            width: 16 * (SizeConfig.widthMultiplier ?? 1),
                          ),
                          Text('8.30 Am', style: AppTextStyle.black40416W600,)
                        ],
                      ),
                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),
                      Row(
                        children: [
                          Text('Work starts from: ', style: AppTextStyle.black40416W400,),
                          SizedBox(
                            width: 16 * (SizeConfig.widthMultiplier ?? 1),
                          ),
                          Text('8.30 Am', style: AppTextStyle.black40416W600,)
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Container(
                  
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: orange),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text('Over Time', style: AppTextStyle.black40418W600,),

                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: orange),
                        ),
                      
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Select Start Time', style: AppTextStyle.black40412W400,),
                            const Icon(Icons.keyboard_arrow_down, color: orange, size: 24,)
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16 * (SizeConfig.heightMultiplier ?? 1),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: orange)
                        ),
                        child: showPicker(
                          dialogInsetPadding: EdgeInsets.all(0),
                          isInlinePicker: true,
                          elevation: 0,
                          value: _time,
                          onChange: onTimeChanged,
                          minuteInterval: TimePickerInterval.FIVE,
                          iosStylePicker: iosStyle,
                          minHour: 1,
                          maxHour: 12,
                          hourLabel: '',
                          minuteLabel: '',
                          is24HrFormat: false,
                          displayHeader: false,
                          cancelText: 'CANCEL',
                          cancelStyle: AppTextStyle.orange14W600,
                          okText: 'SAVE',
                          okStyle: AppTextStyle.orange14W600,
                        ),
                      ),

                      
                      
                      
                      
                      SizedBox(
                        height: 24 * (SizeConfig.heightMultiplier ?? 1),
                      ),
                      
                      AppButtonStyle.ElevatedButtonStyled('DARK', Text('ADD TIME', style: AppTextStyle.whiteText14W600,), () {Get.to(EStartDutyScreen());})

                    ],
                  ),
                ),

                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),

              ],
            ),
          )
        ),
      ),

    );
  }
}
