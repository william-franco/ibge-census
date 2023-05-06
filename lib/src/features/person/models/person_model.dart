class PersonModel {
  String? nome;
  int? regiao;
  int? freq;
  int? rank;
  String? sexo;

  PersonModel({
    this.nome,
    this.regiao,
    this.freq,
    this.rank,
    this.sexo,
  });

  PersonModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    regiao = json['regiao'];
    freq = json['freq'];
    rank = json['rank'];
    sexo = json['sexo'];
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
}
