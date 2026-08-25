void main() {
  List listaProdutos = [1,2,3,'gohan',1.5, true];
  
  print(listaProdutos);
  print(listaProdutos.length);

  List frutas = ['uva', 'goiaba', 'kiwi'];
  List precos = [6.99, 5.5, 33.5];
  var posicao = 1;
  var produto = frutas[posicao];
  var valor = precos[posicao];

  print('O preco da $produto será: $valor reais');
}