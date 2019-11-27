import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Payload {
  @JsonKey(name: '_id')
  String id;
  String tipo;
  String nome;
  String reino;
  String nomecientifico;
  String periodo;
  String description;
  String brilho;
  String clivagem;
  String cor;
  String cortraco;
  String densidade;
  String dureza;
  String fluorescencia;
  String formulaquimica;
  String bibliografia;
  String procedencia;
  String doador;
  String fratura;
  String grupo;
  String sistemacristalino;
  String imageUrl2;
  String imageLegenda;
  String imageUrl;
  String imageLegenda2;
  String imageUrl3;
  String imageLegenda3;
  String imageUrl4;
  String imageLegenda4;
  String imageUrl5;
  String imageLegenda5;
  String imageUrl6;
  String imageLegenda6;
  String createDate;

  Payload();

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}
