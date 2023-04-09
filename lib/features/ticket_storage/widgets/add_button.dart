import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/res/app_colors.dart';

import '../../../res/app_strings.dart';
import '../../../res/app_typography.dart';
import 'add_ticket.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = BorderRadius.circular(20.0);

    return Stack(
      children: [
        SizedBox(
          width: size.width / 3.5,
          height: size.height / 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: radius,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ],
              color: AppColors.buttonColor,
            ),
            child: const Center(
              child: Text(AppStrings.add, style: AppTypography.text16RegularBtn),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: radius,
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  builder: (_) => const AddTicket(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
