void main() {
  for(int i = 0; i < 5; i++) {
    print('hello ${i+1}');
  }

//Variáveis:
  var nome = 'amanda';
  print(nome);

  String texto = 'palavra';
  print(texto);

  int idade;
  idade = 23;
  print(idade);

  double altura;
  altura = 1.75;
  print(altura);

  bool acerto;
  acerto = true;
  print(acerto);  

  String text = 'Amanda';
  int i = 23;
  double numero = 1.66;

  print('Meu nome é: $text');
  print('Idade: $i');
  print('Altura: $numero');

  int a = 10;
  int b = 2;
  int soma = a + b;

  print(soma);

  dynamic age;
  age = 'amanda';
  age = 23;

  print(age);
}