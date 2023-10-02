import 'package:app/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PDFScreen extends StatefulWidget {
  const PDFScreen({super.key, required this.title, required this.pdfUrl});
  final String title;
  final String pdfUrl;

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: FutureBuilder(
          future: FirebaseStorage.instance
              .refFromURL(widget.pdfUrl)
              .getDownloadURL(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PdfViewer.openAsset(
                  'assets/docs/PickMe_Privacy_Policy.pdf');
            } else if (snapshot.hasError) {
              return Text('Error loading PDF');
            } else {
              return spinLoader;
            }
          },
        ),
      ),
    );
  }
}
