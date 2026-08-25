void main() {
  Map usuario = {'nome': 'Amanda', 'idade': '23', 'altura': 1.66};
    print(usuario);
  
  Map funcionario = {
    'administrador': 'Victor',
    'gerente': 'Claudio',
    'costureira': 'Assuncao',
    'contabilista': 'Reginaldo'
  };
    print(funcionario);
    print(funcionario['administrador']);

  Map roupas = {
    1: 'tenis',
    2: 'calca',
    3: 'blusa',
    4: 'cueca',
    5: 'calcinha'
  };
    print(roupas[2]);

    var chaves = roupas.keys;
    var valor = roupas.values;

    print(chaves);
    print(valor);

    List frutas = ['uva', 'goiaba', 'kiwi'];
    List precos = [6.99, 5.5, 33.5];
    int posicao = 1;

    Map caixa = {
      frutas[posicao]:precos[posicao]
    };
    print(caixa);
}