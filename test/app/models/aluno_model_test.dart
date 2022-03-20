import 'package:easy_school_app/app/modules/models/aluno_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> data = {
        "codigo": 2,
        "nome": "Ronie Fernandes",
        "cursos": [
            {
                "codigo": 3,
                "descricao": "PROGRAMAÇÃO",
                "ementa": "Resolução de problemas e desenvolvimento de algoritmos. Análise do problema. Estratégias de solução. Representação e documentação.",
                "curso_alunos": {
                    "codigo_aluno": 2,
                    "codigo_curso": 3
                }
            }
        ]
    };
  

  setUpAll(() {
    
  });

  test('convert aluno from Map to Aluno object', () async {
   Aluno aluno = Aluno.fromMap(data);
    expect(aluno.cursos.length, 1);
  });
}



/*

[
    {
        "codigo": 2,
        "nome": "Ronie Fernandes",
        "cursos": [
            {
                "codigo": 3,
                "descricao": "PROGRAMAÇÃO",
                "ementa": "Resolução de problemas e desenvolvimento de algoritmos. Análise do problema. Estratégias de solução. Representação e documentação.",
                "curso_alunos": {
                    "codigo_aluno": 2,
                    "codigo_curso": 3
                }
            }
        ]
    }
]

*/