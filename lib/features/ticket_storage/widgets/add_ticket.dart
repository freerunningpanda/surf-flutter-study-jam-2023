import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/res/app_colors.dart';

/// Виджет добавления нового билета
class AddTicket extends StatelessWidget {
  const AddTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const radius = Radius.circular(30.0);

    return Container(
      height: size.height / 3,
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
            margin: const EdgeInsets.only(top: 8),
            width: size.width / 9,
            height: size.height * 0.007,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(radius),
              color: AppColors.appGrey,
            ),
          ),
        ],
      ),
    );
  }
}
