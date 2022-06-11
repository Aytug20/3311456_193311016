import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({Key? key}) : super(key: key);

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton.icon(
              onPressed: () async {
                Directory tempDir = await getTemporaryDirectory();
                String path = tempDir.path;
                print('Temp path :' + path);
              },
              icon: Icon(
                Icons.account_tree_outlined,
                size: 18,
              ),
              label: Text(
                "Temp path",
              ),
            ),
            TextButton.icon(
              onPressed: () async {
                Directory permDir = await getApplicationDocumentsDirectory();
                String path = permDir.path;
                print('Geçici Path ' + path);
              },
              icon: Icon(
                Icons.account_tree_rounded,
                size: 18,
              ),
              label: Text(
                "Kalıcı path",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
