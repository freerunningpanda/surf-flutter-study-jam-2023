import 'package:flutter/material.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_strings.dart';
import '../../../res/app_typography.dart';

class TicketWidget extends StatelessWidget {
  final String title;
  const TicketWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 16),
          const Icon(
            Icons.airplane_ticket_outlined,
            color: AppColors.appDarkGrey,
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.text16RegularTitle,
              ),
              const SizedBox(height: 5),
              Container(
                width: size.width / 1.45,
                height: 3,
                color: AppColors.ticketTitleColor,
              ),
              const SizedBox(height: 5),
              // const Text('${AppStrings.loading} 0.0 ${AppStrings.from} 0.0',
              const Text(AppStrings.waiting,
              style: AppTypography.text16RegularDescription,),
            ],
          ),
          const SizedBox(width: 14),
          const Icon(
            Icons.pause_circle_outline,
            color: AppColors.ticketTitleColor,
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
