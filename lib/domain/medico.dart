class Medico {
  final int id;
  final String nome;
  final String especialidade;
  final String crm;
  final String email;
  final String telefone;

  Medico({
    required this.id,
    required this.nome,
    required this.especialidade,
    required this.crm,
    required this.email,
    required this.telefone,
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      id: json['id'],
      nome: json['nome'],
      especialidade: json['especialidade'],
      crm: json['crm'],
      email: json['email'],
      telefone: json['telefone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'especialidade': especialidade,
      'crm': crm,
      'email': email,
      'telefone': telefone,
    };
  }
}
