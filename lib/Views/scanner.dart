import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Models/commande_model2.dart';
import '../ViewModels/commande_view_model.dart';

class QRViewExample extends StatefulWidget {
  final Function(String) onUpdateText;

  const QRViewExample({Key? key, required this.onUpdateText}) : super(key: key);

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey _gLobalkey = GlobalKey();

  QRViewController? controller;
  Barcode? result;
  bool isFetching = false;

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) async {
      setState(() {
        result = event;
      });

      if (result?.code != null) {
        setState(() {
          isFetching = true;
        });


        final commandeViewModel =
            Provider.of<CommandeViewModel>(context, listen: false);

        CommandeQR comm = commandeViewModel.transformQRdata(result!.code!);

        await commandeViewModel.fetchCommandeById(comm.idCmd.toString());

        setState(() {
          isFetching = false;
        });

        widget.onUpdateText(result!.code!);
      } else {
        widget.onUpdateText('');
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose(); // Dispose the controller to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isFetching) // Show the QR code scanner only when not fetching
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
                ],
              ),
            ),
          ),
        const SizedBox(height: 20),
        if (isFetching)
          const CircularProgressIndicator() // Show circular progress indicator while fetching data
        else
          Text(
            result?.code ?? '',
            style: const TextStyle(fontSize: 20),
          ),
      ],
    );
  }
}
