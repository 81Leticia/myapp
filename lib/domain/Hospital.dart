class Hospital {
  late int? id;
  late String nome;
  late String endereco;
  late String cidade;
  late String cep;
  late String telefone;
  late String email;

  Hospital({
    this.id,
    required this.nome,
    required this.endereco,
    required this.cidade,
    required this.cep,
    required this.telefone,
    required this.email,
  });


  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'] ?? 'Nome não disponível';
    endereco = json['endereco'] ?? 'Endereço não disponível';
    cidade = json['cidade'] ?? 'Cidade não informada';
    cep = json['cep'] ?? '00000-000';
    telefone = json['telefone'] ?? 'Telefone não informado';
    email = json['email'] ?? 'Email não informado';
  }

  Map<String, dynamic> toJson() {
    return {

      'nome': nome,
      'endereco': endereco,
      'cidade': cidade,
      'telefone': telefone,
      'email': email,
      'cep': cep,
    };
  }
}


