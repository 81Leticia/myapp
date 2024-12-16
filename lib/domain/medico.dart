class Medico {
  int? id;
  String nome;
  String especialidade;

  Medico({this.id, required this.nome, required this.especialidade});

  // Método para converter JSON em objeto Medico
  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      id: json['id'],
      nome: json['nome'],
      especialidade: json['especialidade'],
    );
  }

  // Método para converter objeto Medico em JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'especialidade': especialidade,
    };
  }
}
