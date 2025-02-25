class Paciente {
  late String nomeCompleto;
  late String cpf;
  late String dataNascimento;
  late String sexoSelecionado;
  late int cartaoSus;
  late int peso;
  late String telefone;
  late String endereco;

  Paciente({
    required this.nomeCompleto,
    required this.cpf,
    required this.dataNascimento,
    required this.sexoSelecionado,
    required this.cartaoSus,
    required this.peso,
    required this.telefone,
    required this.endereco,
  });

  Paciente.fromJson(Map<String, dynamic> json) {

    nomeCompleto = json['nomeCompleto'] ?? '';
    cpf = json['cpf'] ?? '';
    dataNascimento = json['dataNascimento'] ?? '';
    sexoSelecionado = json['sexoSelecionado'] ?? '';
    cartaoSus = json['cartaoSus'] ?? 0;
    peso = json['peso'] ?? 0;
    telefone = json['telefone'] ?? '';
    endereco = json['endereco'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['nomeCompleto'] = nomeCompleto;
    json['cpf'] = cpf;
    json['dataNascimento'] = dataNascimento;
    json['sexoSelecionado'] = sexoSelecionado;
    json['cartaoSus'] = cartaoSus;
    json['peso'] = peso;
    json['telefone'] = telefone;
    json['endereco'] = endereco;

    return json;
  }
}
