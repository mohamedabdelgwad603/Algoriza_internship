import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// ignore: must_be_immutable
class CountryPickerWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  CountryPickerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber phonenumber) {
            ///  number = phonenumber;
            print('${phonenumber.phoneNumber}' + '${controller.text}');
          },
          validator: (val) {
            if (val!.isEmpty)
              return "number must not be empty";
            else
              return null;
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          initialValue: number,
          textFieldController: controller,
          inputDecoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.only(bottom: 15, start: 0),
            border: InputBorder.none,
            hintText: 'Eg. 1147881089',
            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
