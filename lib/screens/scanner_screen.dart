
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scanner_provider.dart';
import '../widgets/result_card.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scannerProvider = Provider.of<ScannerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Product Scanner", style: TextStyle(fontSize: 14)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (scannerProvider.image != null)
                Image.file(scannerProvider.image!, height: 200),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: scannerProvider.isScanning
                    ? null
                    : () => scannerProvider.pickImage(),
                icon: const Icon(Icons.camera_alt),
                label: const Text("Scan Product"),
              ),
              if (scannerProvider.isScanning) ...[
                const SizedBox(height: 20),
                const CircularProgressIndicator(),
              ],
              if (scannerProvider.isVerified != null)
                ResultCard(isVerified: scannerProvider.isVerified!),
            ],
          ),
        ),
      ),
    );
  }
}
