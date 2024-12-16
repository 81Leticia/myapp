class Medico {
  int? id;
  String nome;
  String especialidade;

  Medico({this.id, required this.nome, required this.especialidade});

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      id: json['id'],
      nome: json['nome'],
      especialidade: json['especialidade'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'especialidade': especialidade,
    };
  }
}
