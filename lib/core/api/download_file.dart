import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

import 'endpoints.dart';

class DownloadFiles {
  Future<void> downloadFile(String fileUrl, String fileName) async {
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
          print("Rec: $rec , Total: $total");
        });
      } catch (e) {
        print(e);
      }
    }
    print("Download completed");
  }
}
