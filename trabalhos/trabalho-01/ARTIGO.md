![Ada](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjbeUd124ojyqUbSgEtUZexusouOrpBAzyLPS9CeZNLCFC01mT)

# Ada

Surgida na década de 70, Ada é uma linguagem criada pelo Departamento de Defesa
dos Estados Unidos através de um concurso. O intuito desse concurso era encontrar uma linguagem capaz de substituir as centenas de linguagens de programação utilizada por eles.  Seu desenvolvimento foi inspirado por diversas linguagens principlamente pelo **Pascal**, **Simula** e pelo **Fortran 77**.

Ada foi construída para ser mais que uma linguagem de programação, ela inclui muitos conceitos modernos de engenharia de software como : confiabilidade, portabilidade, modularidade, reusabilidade, eficiência e etc. Seus principais domínios são:  sistemas de controle de tráfego aéreo, aviônicos, dispositivos
médicos, estradas de ferro, foguetes, satélites e comunicações seguras de dados.

A linguagem foi primeiramente padronizada em 1983 pelo ANSI e em 1985 pela ISO (Organização Internacional de Padronização) e em 1995 a ISO padronizou uma versão melhorada conhecida como Ada 95. Ada 95 foi a primeira linguagem de programação orientada ao objeto padronizada internacionalmente.

Nome Ada é uma homenagem a condessa Ada Lovelace. Ela é considerada a primeira programadora da história.

# Classificação

* Estruturada (sequência, decisão ou seleção e iteração) ;
* Tipagem estática (há uma verificação dos tipos usados em dados e variáveis para garantir que sempre está sendo usado um tipo que é esperado em todas as situações) ;
* Imperativa ;
* Orientada a Objetos ;
* Linguagem de alto nível ;

# Python vs Ada

_Para realizar as comparações entre as duas linguagem foram utlizadas as seguintes versões:_
* _Ada 95: http://ideone.com/_
* _Pyton 3.6_

### Estrutura básica de Ada

Antes de iniciar a comparação vamos entender um pouco a estrutura básica do código de Ada.

```Ada
  --Declaracoes de bibliotecas
  Procedure nome_do_programa is
  --Declaracoes de variaveis
  begin
  --Corpo do programa com as instrucoes e calculos
  end nome_do_programa;
```

* **Declaração de biblioteca:** Declaramos todas as bibliotecas que ultilizaremos no código.

```Ada
  With biblioteca; Use biblioteca/funcao;
```


* **Declaração de variáveis:** Como foi citado no tópico _Classificação_, a linguagem é estruturada. Por isso temos que declarar as váriaveis com seus respectivos tipos. Todas elas são declaradas nesse tópico.

```Ada
  variável : tipo de variável;
```

* **Corpo do programa:** Ficará o código em si (sequencia, loops, comando de decisão e etc).

## Capacidade de escrita (Writability)

Para avaliarmos a capacidade de escrita em Ada utilizaremos o exemplo abaixo aonde ambos os códigos exibem o tamanho de um array.

**Exemplo em Python**

```Python
print('Array size:' + str(len(['Deborah', 'Fernada'])))
```

**Exemplo em Ada**

```Ada
with Ada.Text_IO;  use Ada.Text_IO;
 
procedure Array_Length is
   NomeComposto : constant array (Positive range <>) of access constant String
      := (new String'("Deborah"),
          new String'("Fernanda"));
 
begin
   Ada.Text_IO.Put_Line ("  Array Size : " & Integer'Image (NomeComposto'Length));
end Array_Length;
```

Em comparação podemos concluir que Ada tem **menos capacidade de escrita** do que Python, uma vez que, existe diversas notações da linguagem Ada como: obrigatoriedade do ponto e virgula, declaração do inicio/fim do programa principal, indicação de onde os comandos termina e dentre outros.


## Legibilidade

É comprenssível que Ada não seja uma linguagem com muita capacidade de escrita, uma vez que, sua criação foi focada na **legibilidade**. Eles precisavam de uma linguagem no qual fosse fácil de realizar manutenção. Python também é uma linguagem legibilidade, contudo ela não se iguala a de Ada devido a sua tipagem dinamica.

Por exemplo, nos códigos abaixo a função do programa é informar o **dobro do número 5**.

**Em Ada**

```Ada
  With Ada.Text_IO; Use Ada.Text_IO;
  With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
  Procedure Duplicar is
          A,B: Integer;
  begin

    A := 5;
    B := A * 2;
    Put_Line("Duplicado é");
    Put(B);

  end Duplicar;
```

**Em Python**

```Python
a = 5
b = a * 2
print("Duplicado é \n" + str(b))
```

Vamos supor que esses códigos sejam apenas trechos de um programa. Ada irá me garantir que em **todo o programa** a variável A será **somente** números inteiros. O que facilita a compreensão de outras operações envolvendo a variável. Já no Python, ele não me garantirá tal caracteristica. A variável pode mudar em **qualquer momento** no programa o seu tipo. Em programas muito grandes isso pode ser um problema, por isso, Ada é mais **legível** do que Python.

## Expressividade

O Ada fornece um extenso conjunto de recursos para criar programas com módulos de código simultâneos. Java obtém muitos dos mesmos resultados usando a classe Thread. Um módulo de código concorrente Ada é chamado uma **task**.

Um programa em Ada consiste de pelo menos uma, e possível mais tasks, que são executadas simultaneamente. As task são executadas independentemente umas das outras, comunicação / sincronização é alcançada por conceitos de alto nível, como o encontro(rendezvous) ou com objetos protegidos.
 
 ```Ada
With Ada.Text_IO; Use Ada.Text_IO;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;


  Procedure Duplicar is
  
 	subtype N is Integer range 1 .. 10;
	package Random_Number is new Ada.Numerics.Discrete_Random (N);
	use Random_Number;
	G : Generator;
	A: Integer;
	
	
	task seefriend is
		entry handshake;
	end seefriend;

	task body seefriend is
	begin
		delay 5.0;

		accept handshake do 
			Put("Vamos marcar alguma coisa?"); 
		End handshake;

		delay 1.0;
		
	end seefriend;
  	 
  begin
	Reset (G);
	A := Random(G);

	for i in 1 .. A loop
		delay(1.0);
	end loop;

	seefriend.handshake;

  end Duplicar;
 ```
 
O recurso mecanismo usado acima foi o de encontro(rendezvous). Ele é um recurso de tasks para se comunicar e sincronizar com segurança umas com as outras. Quando exemplo é executado, a tarefa single_entry é inciada. Se ela for bem sucedida, a tarefa principal também é ativada. Se 'random' retorna um valor menor que 5, então após o atraso inicial a tarefa principal aguarda a segunda tarefa, e vice-versa se retorna maior que 5. Uma vez que as duas tarefas têm encontro, eles partem em seus 'caminhos' separadamente. A tarefa principal termina, a segunda tarefa continua até que ela também termine. O programa termina então. Isso tudo ocorre paralelamente, ajudando também na performace do programa.

Já em Python não é possível fazer essa operação com thread de forma paralela pois existe a limitação do Global Interpreter Lock ou GIL. Ainda que eu tenha dois processadores e duas threads, apenas uma thread poderá estar executando código dentro das regiões protegidas pelo GIL. Com isso, para esta finalidade, temos que Ada **é mais expressiva** do que Python.

# Conclusão

Em resumo, Ada foi projetada para maximizar a verificação de erros que um
compilador pode fazer no início do processo de desenvolvimento. Cada construção
sintática se destina a ajudar o compilador atingir esse objetivo. Com isso ela se torna extramente poderosa para o seu domínio principal.

# Referências

* Jaior - http://www.jairo.pro.br/lpi/ling_prog.pdf
* Mostre ao mundo - http://www.mostreaomundo.com.br/2012/10/linguagem-de-programacao-ada.html
* Wikipedia - https://pt.wikipedia.org/wiki/Ada_(linguagem_de_programa%C3%A7%C3%A3o)
* Goanna - http://goanna.cs.rmit.edu.au/~dale/ada/aln/15_concurrency.html
* Python - http://wiki.python.org.br/PerguntasFrequentes/SobreProgramacao
