import 'package:flutter/material.dart';
import 'package:fossil/data/payload.dart';

class ArtefatoPage extends StatefulWidget {
  ArtefatoPage({Key key, @required this.artefato}) : super(key: key);

  final Payload artefato;

  @override
  _ArtefatoPageState createState() => _ArtefatoPageState();
}

class _ArtefatoPageState extends State<ArtefatoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Payload _artefato;
  List<FotoLegenda> _imagens;
  List<Widget> _fichaTecnica;

  @override
  void initState() {
    super.initState();
    _imagens = List<FotoLegenda>();
    _fichaTecnica = List<Widget>();
    _artefato = widget.artefato;
    _carregarArtefato();
  }

  void _carregarArtefato() async {
    if (_artefato.tipo == 'mineral') {
      if (_artefato.grupo != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Grupo: ', _artefato.grupo),
        );
      }
      if (_artefato.sistemacristalino != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica(
              'Sistema Cristalino: ', _artefato.sistemacristalino),
        );
      }
      if (_artefato.formulaquimica != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica(
              'Fórmula Química: ', _artefato.formulaquimica),
        );
      }
      if (_artefato.dureza != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Dureza: ', _artefato.dureza),
        );
      }
      if (_artefato.clivagem != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Clivagem: ', _artefato.clivagem),
        );
      }
      if (_artefato.fratura != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Fratura: ', _artefato.fratura),
        );
      }
      if (_artefato.cor != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Cor: ', _artefato.cor),
        );
      }
      if (_artefato.cortraco != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Cor do Traço: ', _artefato.cortraco),
        );
      }
      if (_artefato.brilho != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Brilho: ', _artefato.brilho),
        );
      }
      if (_artefato.fluorescencia != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Fluorescência: ', _artefato.fluorescencia),
        );
      }
      if (_artefato.densidade != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Densidade: ', _artefato.densidade),
        );
      }
    } else if (_artefato.tipo == 'fossil') {
      if (_artefato.reino != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Reino: ', _artefato.reino),
        );
      }
      if (_artefato.nomecientifico != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica(
              'Nome Científico: ', _artefato.nomecientifico),
        );
      }
      if (_artefato.periodo != null) {
        _fichaTecnica.add(
          _buildLinhaFichaTecnica('Período: ', _artefato.periodo),
        );
      }
    }

    // imagens e legendas
    _imagens.addAll([
      FotoLegenda(_artefato.imageUrl, _artefato.imageLegenda),
      FotoLegenda(_artefato.imageUrl2, _artefato.imageLegenda2),
      FotoLegenda(_artefato.imageUrl3, _artefato.imageLegenda3),
      FotoLegenda(_artefato.imageUrl4, _artefato.imageLegenda4),
      FotoLegenda(_artefato.imageUrl5, _artefato.imageLegenda5),
      FotoLegenda(_artefato.imageUrl6, _artefato.imageLegenda6)
    ].toList().where((p) => p.url != null));

    setState(() {
      _tabController = TabController(
        vsync: this,
        length: _imagens.length,
        initialIndex: 0,
      );
    });
  }

  Widget _buildLinhaFichaTecnica(String esq, String dir) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            height: 1.3,
            fontFamily: 'Noto Serif'),
        children: <TextSpan>[
          TextSpan(
            text: esq,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: dir),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Museu de Minerais, Rochas e Fósseis',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                _artefato.nome,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Divider(),
              Column(
                children: <Widget>[
                  LimitedBox(
                    maxHeight: 250.0,
                    child: TabBarView(
                      controller: _tabController,
                      children: _imagens
                          .map(
                            (fotoLegenda) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Image.network(
                                        fotoLegenda.url,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    fotoLegenda.legenda ?? '',
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  TabPageSelector(
                    controller: _tabController,
                    color: Colors.transparent,
                    selectedColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (_artefato.description != null)
                            Text(
                              _artefato.description,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          if (_artefato.bibliografia != null)
                            Text(
                              'Bibliografia:',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _artefato.bibliografia,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          if (_artefato.procedencia != null)
                            Text(
                              'Procedencia:',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _artefato.procedencia,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          if (_artefato.doador != null)
                            Text(
                              'Doador:',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _artefato.doador,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          Text(
                            'Ficha Técnica',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                          ..._fichaTecnica
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FotoLegenda {
  final String url;
  final String legenda;
  FotoLegenda(this.url, this.legenda);
}
