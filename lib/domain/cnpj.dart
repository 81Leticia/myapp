class Cnpj {
  late String cnpj;
  late String descricaoMatrizFilial;
  late String razaoSocial;
  late String nomeFantasia;
  late String situacaoCadastral;
  late String dataSituacaoCadastral;
  late String motivoSituacaoCadastral;
  late String cnaeFiscalDescricao;
  late String logradouro;
  late String numero;
  late String complemento;
  late String bairro;
  late String cep;
  late String municipio;
  late String uf;
  late String telefone1;
  late String? telefone2;
  late String? fax;
  late String qualificacaoResponsavel;
  late String capitalSocial;
  late String porteDescricao;
  late bool opcaoPeloSimples;
  late bool opcaoPeloMei;

  Cnpj({
    required this.cnpj,
    required this.descricaoMatrizFilial,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.situacaoCadastral,
    required this.dataSituacaoCadastral,
    required this.motivoSituacaoCadastral,
    required this.cnaeFiscalDescricao,
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.cep,
    required this.municipio,
    required this.uf,
    required this.telefone1,
    this.telefone2,
    this.fax,
    required this.qualificacaoResponsavel,
    required this.capitalSocial,
    required this.porteDescricao,
    required this.opcaoPeloSimples,
    required this.opcaoPeloMei,
  });

  Cnpj.fromJson(Map<String, dynamic> json) {
    cnpj = json['cnpj'] ?? '';
    descricaoMatrizFilial = json['descricao_matriz_filial'] ?? '';
    razaoSocial = json['razao_social'] ?? '';
    nomeFantasia = json['nome_fantasia'] ?? '';
    situacaoCadastral = json['situacao_cadastral'].toString() ?? '';
    dataSituacaoCadastral = json['data_situacao_cadastral'] ?? '';
    motivoSituacaoCadastral = json['motivo_situacao_cadastral'].toString() ?? '';
    cnaeFiscalDescricao = json['cnae_fiscal_descricao'] ?? '';
    logradouro = json['descricao_tipo_de_logradouro'] ?? '' + ' ' + (json['logradouro'] ?? '');
    numero = json['numero'] ?? '';
    complemento = json['complemento'] ?? '';
    bairro = json['bairro'] ?? '';
    cep = json['cep'].toString() ?? '';
    municipio = json['municipio'] ?? '';
    uf = json['uf'] ?? '';
    telefone1 = json['ddd_telefone_1'] ?? '';
    telefone2 = json['ddd_telefone_2'] ?? '';
    fax = json['ddd_fax'] ?? '';
    qualificacaoResponsavel = json['qualificacao_do_responsavel'].toString() ?? '';
    capitalSocial = json['capital_social'].toString() ?? '';
    porteDescricao = json['descricao_porte'] ?? '';
    opcaoPeloSimples = json['opcao_pelo_simples'] ?? false;
    opcaoPeloMei = json['opcao_pelo_mei'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cnpj'] = this.cnpj;
    data['descricao_matriz_filial'] = this.descricaoMatrizFilial;
    data['razao_social'] = this.razaoSocial;
    data['nome_fantasia'] = this.nomeFantasia;
    data['situacao_cadastral'] = this.situacaoCadastral;
    data['data_situacao_cadastral'] = this.dataSituacaoCadastral;
    data['motivo_situacao_cadastral'] = this.motivoSituacaoCadastral;
    data['cnae_fiscal_descricao'] = this.cnaeFiscalDescricao;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['cep'] = this.cep;
    data['municipio'] = this.municipio;
    data['uf'] = this.uf;
    data['ddd_telefone_1'] = this.telefone1;
    data['ddd_telefone_2'] = this.telefone2;
    data['ddd_fax'] = this.fax;
    data['qualificacao_do_responsavel'] = this.qualificacaoResponsavel;
    data['capital_social'] = this.capitalSocial;
    data['descricao_porte'] = this.porteDescricao;
    data['opcao_pelo_simples'] = this.opcaoPeloSimples;
    data['opcao_pelo_mei'] = this.opcaoPeloMei;

    return data;
  }
}