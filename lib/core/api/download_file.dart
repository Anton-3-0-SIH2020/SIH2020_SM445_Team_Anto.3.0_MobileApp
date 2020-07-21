import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

import 'endpoints.dart';

class DownloadFiles {
  Future<void> downloadFile(
      String fileUrl, String fileName, Function onDownloadStart) async {
    var status = await Permission.storage.status;
    if (status.isUndetermined) {
      print('----Asking For Storage Permissions----');
    }
    if (await Permission.location.isRestricted) {
      print('----Access Restricted----');
    }

    if (await Permission.storage.request().isGranted) {
      print('Downloading...');
      Dio dio = Dio();
      try {
        await dio.download(fileUrl, "${'/sdcard/Download'}/$fileName",
            onReceiveProgress: (rec, total) {
          double percentage = (rec * 100) / total;
          onDownloadStart(percentage);
          print(percentage.toInt());
        });
      } catch (e) {
        print(e);
      }
    }
    print("Download completed");
  }
}
