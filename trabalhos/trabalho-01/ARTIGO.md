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

Para avaliarmos a capacidade de escrita em Ada utilizaremos o exemplo de Hello World.

**Exemplo em Python**

```Python
  print ("Hello World! \n")
```

**Exemplo em Ada**

```Ada
  With Ada.Text_IO; Use Ada.Text_IO;  

  procedure HelloWorld is
  begin
    Put_Line("Hello World! ");
  end HelloWorld;
```

**Saída de ambos os programas**

```Saida
  Hello World
  
```
É possível notar que com Python temos menos "burocracia" para escrever um Hello World na tela. Dessa forma, podemos conluir que Ada tem **menos capacidade de escrita** do que Python.

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
  print("Duplicado é \n" + b)
```

Vamos supor que esses códigos sejam apenas trechos de um programa. Ada irá me garantir que em **todo o programa** a variável A será **somente** números inteiros. O que facilita a compreensão de outras operações envolvendo a variável. Já no Python, ele não me garantirá tal caracteristica. A variável pode mudar em **qualquer momento** no programa o seu tipo. Em programas muito grandes isso pode ser um problema, por isso, Ada é mais **legível** do que Python.

## Expressividade

# Conclusão
