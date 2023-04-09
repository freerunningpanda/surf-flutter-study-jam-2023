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
  late CancelToken _cancelToken;
  bool _isDownloadStarted = false;

  bool _isDownloadFinished = false;

  int _downloadedSizeInBytes = 0;
  int _totalSizeInBytes = -1;
  double _progress = 0.0;

  @override
  void initState() {
    _cancelToken = CancelToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final downloadedSizeInMB = _downloadedSizeInBytes / (1024 * 1024);
    final totalSizeInMB = _totalSizeInBytes / (1024 * 1024);

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
              SizedBox(
                height: 3,
                width: size.width / 1.5,
                child: LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: AppColors.appGrey,
                  color: AppColors.ticketTitleColor,
                ),
              ),
              const SizedBox(height: 5),
              if (!_isDownloadStarted && _progress == 0)
                const Text(
                  AppStrings.waiting,
                  style: AppTypography.text16RegularDescription,
                ),
              if (_progress > 0.0 && !_isDownloadFinished)
                Text(
                  '${AppStrings.loading} ${downloadedSizeInMB.toStringAsFixed(2)} ${AppStrings.from} ${totalSizeInMB.toStringAsFixed(2)}',
                  style: AppTypography.text16RegularDescription,
                ),
              if (_isDownloadFinished)
                const Text(
                  AppStrings.loaded,
                  style: AppTypography.text16RegularDescription,
                ),
            ],
          ),
          const SizedBox(width: 14),
          GestureDetector(
            onTap: _isDownloadFinished ? null : () => openFile(fileName: widget.title, url: widget.url),
            child: Column(
              children: [
                if (!_isDownloadStarted && _progress == 0)
                  const Icon(
                    Icons.cloud_download_outlined,
                    color: AppColors.ticketTitleColor,
                  ),
                if (_progress > 0.0 && !_isDownloadFinished)
                  GestureDetector(
                    onTap: _isDownloadStarted ? _pauseDownload : null,
                    child: const Icon(
                      Icons.pause_circle_outline,
                      color: AppColors.ticketTitleColor,
                    ),
                  ),
                if (_isDownloadFinished)
                  const Icon(
                    Icons.cloud_done,
                    color: AppColors.ticketTitleColor,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  /// Метод остановки загрузки
  void _pauseDownload() {
    setState(() {
      _isDownloadStarted = false;
    });
    _cancelToken.cancel();
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
      setState(() {
        _isDownloadStarted = true;
      });
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(seconds: 60),
        ),
        onReceiveProgress: (count, total) {
          if (total != -1) {
            setState(() {
              _downloadedSizeInBytes = count;
              _totalSizeInBytes = total;
              _progress = count / total;
            });
          }
        },
        cancelToken: _cancelToken,
      );
      setState(() {
        _isDownloadFinished = true;
      });
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
