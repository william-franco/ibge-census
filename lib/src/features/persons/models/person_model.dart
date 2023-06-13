// Package imports:
import 'package:equatable/equatable.dart';

class PersonModel extends Equatable {
  final String? nome;
  final int? regiao;
  final int? freq;
  final int? rank;
  final String? sexo;

  const PersonModel({
    this.nome,
    this.regiao,
    this.freq,
    this.rank,
    this.sexo,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      nome: json['nome'] as String?,
      regiao: json['regiao'] as int?,
      freq: json['freq'] as int?,
      rank: json['rank'] as int?,
      sexo: json['sexo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['regiao'] = regiao;
    data['freq'] = freq;
    data['rank'] = rank;
    data['sexo'] = sexo;
    return data;
  }

  @override
  List<Object?> get props => [
        nome,
        regiao,
        freq,
        rank,
        sexo,
      ];
}
