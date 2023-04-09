import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/data/model/ticket.dart';
import 'package:surf_flutter_study_jam_2023/res/app_colors.dart';

import '../../../data/storage/tickets.dart';
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
              label: const Text(
                AppStrings.enterUrl,
                style: AppTypography.text14Light,
              ),
              hintText: AppStrings.enterUrl,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: AppColors.buttonTextColor),
                borderRadius: textFieldRadius,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.appGrey),
                borderRadius: textFieldRadius,
              ),
            ),
            onTap: () {
              /// Для смены размера боттомшита при нажатии на текстовое поле
              setState(
                () {
                  isPressed = true;
                },
              );
            },
            onFieldSubmitted: (value) {
              /// Для возврата размера боттомшита при отправке данных
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

/// Виджет кнопки "Добавить"
class _AddButton extends StatefulWidget {
  const _AddButton({Key? key}) : super(key: key);

  @override
  State<_AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<_AddButton> {
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
              onTap: () {
                Storage.list.add(
                  Ticket(title: 'Ticket 2'),
                );
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
