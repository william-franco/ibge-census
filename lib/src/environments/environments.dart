class Environments {
  static const String baseURL = String.fromEnvironment(
    'servico-dados-ibge',
    defaultValue: 'https://servicodados.ibge.gov.br/api/v2/censos',
  );

  static const String nomes = String.fromEnvironment(
    'nomes',
    defaultValue: '/nomes',
  );
}
