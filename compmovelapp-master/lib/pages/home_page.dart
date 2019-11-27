import 'package:flutter/material.dart';
import 'package:fossil/data/utils.dart';
import 'package:fossil/logo_widget.dart';
import 'package:fossil/pages/artefato_page.dart';
import 'package:fossil/pages/museu_page.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LogoWidget(),
              BotaoQRCode(),
              BotaoSobreMuseu(),
            ],
          ),
        ),
      ),
    );
  }
}

class BotaoSobreMuseu extends StatelessWidget {
  const BotaoSobreMuseu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OutlineButton.icon(
        padding: EdgeInsets.all(8.0),
        icon: Icon(Icons.info_outline),
        label: Text(
          'Sobre o museu',
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MuseuPage(title: 'Sobre o museu'),
            ),
          );
        },
      ),
    );
  }
}

class BotaoQRCode extends StatelessWidget {
  const BotaoQRCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OutlineButton.icon(
        padding: EdgeInsets.all(8.0),
        icon: Icon(Icons.search),
        label: Text(
          'Leitor de QR Code',
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () async {
          final _barcode = await QRCodeReader()
              .setHandlePermissions(true)
              .setExecuteAfterPermissionGranted(true)
              .scan();
          if (_barcode != null) {
            try {
              final payload = await fetchPayload(_barcode);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtefatoPage(
                    artefato: payload,
                  ),
                ),
              );
            } catch (e) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    'Problema ao carregar os dados.\nTente novamente.',
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 4),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
