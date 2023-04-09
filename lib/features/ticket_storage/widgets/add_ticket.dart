import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_study_jam_2023/data/model/ticket.dart';
import 'package:surf_flutter_study_jam_2023/res/app_colors.dart';

import '../../../bloc/add_ticket_bloc.dart';
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
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPressed = false;
  bool _isValidate = false;

  @override
  void initState() {
    super.initState();

    getClipboardData().then((String? value) {
      if (value != null && value.endsWith('.pdf')) {
        _controller.text = value;
      }
    });
  }

  Future<String?> getClipboardData() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const radius = Radius.circular(30.0);
    final textFieldRadius = BorderRadius.circular(12.0);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      width: size.width,
      height: _isPressed ? size.height / 1.2 : size.height / 2.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        color: AppColors.backgroundColor,
      ),
      child: Form(
        key: _formKey,
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
              key: const Key('url'),
              controller: _controller,
              validator: validator,
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
              onChanged: (value) => validator(_controller.text),
              onTap: () {
                /// Для смены размера боттомшита при нажатии на текстовое поле
                validator(_controller.text);
                setState(
                  () {
                    _isPressed = true;
                  },
                );
              },
              onFieldSubmitted: (value) {
                /// Для возврата размера боттомшита при отправке данных
                setState(
                  () {
                    _isPressed = false;
                    _isValidate = false;
                  },
                );

                if (_formKey.currentState!.validate()) {
                  final uri = Uri.parse(value);

                  /// Формируем название из конечного пути ссылки
                  final ticketName = uri.pathSegments.last;
                  Storage.list.add(
                    Ticket(
                      fileName: ticketName,
                      url: value,
                    ),
                  );
                  context.read<AddTicketBloc>().add(
                        AddTicketEvent(ticketList: Storage.list),
                      );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.succesAddUrl),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 30),
            _AddButton(
              url: _controller.text,
              isValidate: _isValidate,
              isPressed: _isPressed,
            ),
          ],
        ),
      ),
    );
  }

  /// Валидатор ссылок
  String? validator(String? value) {
    const String pattern = r'^(?:http|https):\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(?:\/[\w\-\.\/]*)*\/?$';
    RegExp regExp = RegExp(pattern);

    // Если символы соответствуют структуре url - Ок
    if (regExp.hasMatch(value ?? '')) {
      setState(() {
        _isValidate = true;
      });
    }
    // Если поле пустое - выдаст ошибку
    if (value == null || value.isEmpty) {
      setState(() {
        _isValidate = false;
      });
      return AppStrings.enterUrl;
    }

    // Если символы не соответствуют структуре url - выдаст ошибку
    if (!regExp.hasMatch(value)) {
      setState(() {
        _isValidate = false;
      });
      return AppStrings.validateUrl;
    }
    return null;
  }
}

/// Виджет кнопки "Добавить"
class _AddButton extends StatelessWidget {
  final String url;
  final bool isValidate;
  final bool isPressed;

  const _AddButton({
    Key? key,
    required this.url,
    required this.isValidate,
    required this.isPressed,
  }) : super(key: key);

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
              color: isValidate ? AppColors.ticketTitleColor : AppColors.appGrey,
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
            onTap: isValidate
                ? () {
                    final uri = Uri.parse(url);

                    /// Формируем название из конечного пути ссылки
                    final ticketName = uri.pathSegments.last;
                    Storage.list.add(
                      Ticket(
                        fileName: ticketName,
                        url: url,
                      ),
                    );
                    context.read<AddTicketBloc>().add(
                          AddTicketEvent(ticketList: Storage.list),
                        );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(AppStrings.succesAddUrl),
                      ),
                    );
                    isPressed;
                    isValidate;
                  }
                : null,
          ),
        )),
      ],
    );
  }
}
