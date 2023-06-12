import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRViewExample extends StatefulWidget {
  final Function(String) onUpdateText;
  const QRViewExample({Key? key, required this.onUpdateText}) : super(key: key);

  @override
  State<QRViewExample> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QRViewExample> {
  final GlobalKey _gLobalkey = GlobalKey();

  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
        if (result == null) {
          widget.onUpdateText('');
        }
        if (result?.code != null) {
          widget.onUpdateText(result!.code!);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 400,
                  width: 400,
                  alignment: Alignment.center,
                  child: QRView(key: _gLobalkey, onQRViewCreated: qr),
                ),
                Center(
                  child: (result != null) ? Text('${result!.code}') : Text(''),
                ),
                /*ElevatedButton(
                  onPressed: () {
                    Provider.of<CommandeViewModel>(context, listen: false)
                        .fetchCommandebById("1");
                  },
                  child: Text('Change Data'),
                )*/
              ],
            ),
          ),
        ),
      ],
    );
  }
}
