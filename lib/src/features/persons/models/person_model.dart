class PersonModel {
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

  PersonModel copyWith({
    String? nome,
    int? regiao,
    int? freq,
    int? rank,
    String? sexo,
  }) {
    return PersonModel(
      nome: nome ?? this.nome,
      regiao: regiao ?? this.regiao,
      freq: freq ?? this.freq,
      rank: rank ?? this.rank,
      sexo: sexo ?? this.sexo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PersonModel &&
        other.nome == nome &&
        other.regiao == regiao &&
        other.freq == freq &&
        other.rank == rank &&
        other.sexo == sexo;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        regiao.hashCode ^
        freq.hashCode ^
        rank.hashCode ^
        sexo.hashCode;
  }
}
