(* ==================================== *)
(* Wolfram Language (WL) Highlight Test  *)
(* ==================================== *)

(* 1. Variáveis e Definições *)
ClearAll[myFunction, globalVar, piValue];
globalVar = 100;
piValue = N[Pi];

(* 2. Definição de Função e Argumentos Padrão *)
myFunction[x_] := x^2 + globalVar;

myFunction[x_, y_: 5] := (
  (* Comentário interno: Verifica o tipo de dados *)
  If[Head[x] === Integer,
    result = x * y;
  ,
    result = x + y;
  ];
  result
);

(* 3. Estruturas de Controle e Funções Built-in (Deve ter destaque diferente) *)
dataList = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

(* Funções de matemática e processamento de lista *)
meanResult = Mean[dataList];
totalSum = Total[dataList];

(* Estruturas de iteração e condicionais *)
Map[myFunction[#] &, dataList];

Do[
  Print["Iteração:", i];
, {i, 1, 3}];

(* 4. Strings e Números *)
titleString = "Cálculo de Média (Mean)";
scientificNotation = 1.2345 * 10^5;
complexNumber = 3 + 4I;

(* 5. Padrões e Opções (Padrões do WL) *)
Options[ProcessData] = {Verbose -> True, Threshold -> 0.5};

ProcessData[list_, OptionsPattern[]] := (
  If[OptionValue[Verbose], Print["Iniciando processamento..."]];
  Select[list, # > OptionValue[Threshold] &]
);

(* Testando a função com opções *)
processedList = ProcessData[{0.1, 0.6, 0.3, 0.8}, Threshold -> 0.7];

(* 6. Erros e Símbolos não definidos (O LSP pode marcar, mas o Tree-sitter destaca a sintaxe) *)
wrongVariable = totalSum * unefinedSymbol;
