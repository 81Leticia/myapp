class Hospital {
  late int? id;
  late String nome;
  late String endereco;
  late String cidade;
  late String cep;
  late String telefone;
  late String email;
  //String fotoUrl = "null"; // Valor padrão para fotoUrl

  // Construtor principal
  Hospital({
    this.id,
    required this.nome,
    required this.endereco,
    required this.cidade,
    required this.cep,
    required this.telefone,
    required this.email,
    // this.fotoUrl = "null", // Valor padrão opcional
  });

  // Construtor para criar a instância a partir de um JSON
  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id']; // Valor padrão para id
    nome = json['nome'] ?? 'Nome não disponível'; // Valor padrão
    endereco = json['endereco'] ?? 'Endereço não disponível';
    cidade = json['cidade'] ?? 'Cidade não informada';
    cep = json['cep'] ?? '00000-000';
    telefone = json['telefone'] ?? 'Telefone não informado';
    email = json['email'] ?? 'Email não informado';
    //fotoUrl = json['fotoUrl'] ?? "null"; // Valor padrão
  }

  Map<String, dynamic> toJson() {
    return {

      'nome': nome,
      'endereco': endereco,
      'cidade': cidade,
      'telefone': telefone,
      'email': email,
      'cep': cep,
      // 'fotoUrl': fotoUrl,
    };
  }
}

