import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_strings.dart';
import '../../../res/app_typography.dart';

class TicketWidget extends StatefulWidget {
  final String title;
  final String url;
  const TicketWidget({Key? key, required this.title, required this.url}) : super(key: key);

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Row(
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
                widget.title,
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
              const Text(
                AppStrings.waiting,
                style: AppTypography.text16RegularDescription,
              ),
            ],
          ),
          const SizedBox(width: 14),
          GestureDetector(
            onTap: () => openFile(
              fileName: widget.title,
              url: widget.url),
            child: const Icon(
              Icons.pause_circle_outline,
              color: AppColors.ticketTitleColor,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  // Метод открытия файла
  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);
    /// Проверяем если наш файл не Null
    if (file == null) return;

    debugPrint('Path: ${file.path}');
    /// Мы можем открыть этот файл
    OpenFile.open(file.path);
  }

  /// Скачать файл с приватную папку невидимую для пользователя
  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name'); // Здесь храним наш файл

    try {
      // Скачиваем файл
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(seconds: 20),
        ),
      );
      
      // Открываем файл в режиме записи и записываем в него данные
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      // Завершаем процесс записи содержимого из response.data. Освобождаем ресурсы
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }
}
