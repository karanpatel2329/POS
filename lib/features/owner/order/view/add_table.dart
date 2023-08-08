import 'package:flutter/material.dart';
import 'package:pos_app/core/constants/app_button_style.dart';
import 'package:pos_app/core/constants/app_text_style.dart';
import 'package:pos_app/core/constants/color_palette.dart';
import 'package:pos_app/core/size_config.dart';

class AddTableScreen extends StatefulWidget {
  AddTableScreen({super.key});

  @override
  State<AddTableScreen> createState() => _AddTableScreenState();
}

class _AddTableScreenState extends State<AddTableScreen> {
  TextEditingController tableName = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = '2';

  // List of items in our dropdown menu
  var items = [
    '2',
    '4',
    '6',
  ];

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Table',
          style: AppTextStyle.black40420W600,
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                SizedBox(
                  height: 24 * (SizeConfig.heightMultiplier ?? 1),
                ),

                TextFormField(
                  controller: tableName,
                  decoration: InputDecoration(
                    hintText: 'Name of the table',
                    labelText: 'Name of the table',
                    labelStyle: AppTextStyle.black40416W400,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: orange,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder( 
                        borderSide: BorderSide(
                            width: 1.0, color: orange), 
                      ),
                  )
                ),
          
                SizedBox(
                  height: 16 * (SizeConfig.heightMultiplier ?? 1),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: orange, style: BorderStyle.solid, width: 0.80),
                  ),
                  child: DropdownButton(
                    hint: Text('Select seater'),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
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
                SizedBox(
                  height: 32 * (SizeConfig.heightMultiplier ?? 1),
                ),
                AppButtonStyle.ElevatedButtonStyled('DARK', Text('ADD', style: AppTextStyle.whiteText14W600,), () { })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
