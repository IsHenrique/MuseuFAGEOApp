import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logos/MMRF.png'),
            backgroundColor: Colors.transparent,
            maxRadius: 80,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 8.0,
            right: 8.0,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            softWrap: true,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Universidade Federal de Mato Grosso\n',
                  style: TextStyle(
                    fontFamily: 'Noto Serif',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                TextSpan(
                  text: 'Museu de Minerais, Rochas e Fósseis\n',
                  style: TextStyle(
                    fontFamily: 'Noto Serif',
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                TextSpan(
                  text: 'Geologia',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
