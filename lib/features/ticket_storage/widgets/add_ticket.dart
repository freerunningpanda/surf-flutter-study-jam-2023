import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/res/app_colors.dart';

import '../../../res/app_strings.dart';
import '../../../res/app_typography.dart';

/// Виджет добавления нового билета
class AddTicket extends StatefulWidget {
  const AddTicket({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const radius = Radius.circular(30.0);
    final textFieldRadius = BorderRadius.circular(12.0);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      width: size.width,
      height: isPressed ? size.height / 1.3 : size.height / 2.9,
      // height: 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        color: AppColors.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 40),
            width: size.width / 9,
            height: size.height * 0.007,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(radius),
              color: AppColors.appGrey,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              // hintText: widget.hintText,
              hintStyle: AppTypography.text16Regular,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(width: 2, color: widget.theme.sliderTheme.overlayColor as Color),
                borderRadius: textFieldRadius,
              ),
              enabledBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: widget.theme.sliderTheme.overlayColor as Color),
                borderRadius: textFieldRadius,
              ),
            ),
            onTap: () {
              setState(
                () {
                  isPressed = true;
                },
              );
            },
            onFieldSubmitted: (value) {
              setState(
                () {
                  isPressed = false;
                },
              );
            },
          ),
          const SizedBox(height: 30),
          const _AddButton(),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = BorderRadius.circular(50.0);

    return Stack(
      children: [
        SizedBox(
          width: size.width / 2.5,
          height: size.height / 14,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: radius,
              color: AppColors.appGrey,
            ),
            child: const Center(
              child: Text(
                AppStrings.add,
                style: AppTypography.text16RegularBtnWhite,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: radius,
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
