//
//  textos.swift
//  Mini02
//
//  Created by Rafael Costa on 24/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit
//Mudar "a" e "p" nas funcoes refazer, f1, f2, f3, f4, f5, f6, f7 e f8 após ter o valor inicial delas para cada fase
var fim = 1 //Determina o final que será apresentado
var pula = false
var a = 0 //Ajuda da tela atual
var p = 1 //Perguntas e possíveis respostas da tela atual
var i : intmax_t!
var r = 0 //Salva a resposta escolida
var c = 0 //Representa a fala inicial da fase
var contadorBanco = 0
//Todas as falas do jogo em ordem de aparição
let texto = [
    //Inicio cap 1
1: "\(Personagem.shared.nome!)… Hoje é um belo dia.\nOs pássaros estão cantando, o céu está ensolarado…\nE o seu salário caiu.", //Narrador
2: "Fala aí, \(Personagem.shared.nome!)!\nRecebeu hoje, né?",
3: "Ehh… Não foi isso que conversamos ontem, \(Personagem.shared.nome!)",
4: "Olha só, nossa conversa de ontem até que fez efeito!",
5: "De qualquer forma, sua situação está mesmo caótica.\nDesespero nunca é a saída. Mas eu estaria desesperada no seu lugar!",
6: "Pagar conta é massa, mas pensar no futuro também é, sabe?!",
7: "Dói guardar o dinheiro que não tem, né?",
8: "Vou te ajudar nessa, cara. Cola aí!", //Seta pro banco
9: "Mas isso é história para mais tarde.\nAprenda com leveza, \(Personagem.shared.nome!).", //Volta do banco
10: "…PARA DE GASTAR SEM NECESSIDADE!",
11: "Oh? Coitadinho…",
12: "Mas relaxa, dessa vez eu pago pra gente.",
    //Inicio cap 2
13: "\(Personagem.shared.nome!), esse é o seu pior inimigo…\nNão, não o shopping.\nO cartão de crédito.", //Narrador
14: "Que espaço lindo! Quanto lugar legal!",
15: "E acumular várias dívidas pelos próximos meses!",
16: "…Você por acaso tem saldo na conta pra passar no débito?",
17: "Você tem uma arma poderosa aí na sua carteira. Use-a com responsabilidade.",
18: "O crédito é como se fosse um empréstimo. Você está gastando, em tese, o que não tem!\nDepois, precisa pagar tudo.\nA famosa fatura.",
19: "Mas é bom você não esquecer disso por, pelo menos, 40 dias. Hehe.",
20: "E é bom pagar o mais rápido possível. Em até 40 dias, para ser mais exata.",
21: "Isso porque, se passar desse prazo, você corre o risco de ser negativado.\nNão fica perdido que vou te ajudar nisso!", //Seta pro banco
22: "Enfim! Vamos voltar para lá! A fome é grande, mas comer em casa sai mais barato.\nInclusive, queeem sabe não te dou umas dicas para gastar menos…",
    //Inicio cap 3
23: "...\(Personagem.shared.nome!).",
24: "Poxa… Mas você conseguiu pagar sua fatura. Não é tudo, mas é algo.",
25: "Que bom! Mas ei, você precisa aprender muito ainda.",
26: "Pagar as contas é um alívio, mas você tem que tomar cuidado pra não se afundar em dívidas de novo.",
27: "MUAHAHAH! Eu sei, eu sei! Eu sou demais, mesmo!",
28: "Calma lá. Super Kim está aqui para te ajudar!",
29: "Primeiro passo: você precisa saber o que gasta todo mês.\nSó que é impossível saber exatamente, porque tem gasto que conseguimos prever, tem gasto que não.",
30: "É o que separamos entre despesa fixa e despesa variável.\nVamos ver isso melhor?", //Seta pro banco
31: "Outra coisa importante é criar uma reserva de emergência.\nVocê só vai usar essa reserva em… emergências! Desemprego, por exemplo.", // volta
32: "Essa reserva pode variar entre 3 a 6 salários atuais.\nPara se organizar melhor, você pode usar uma planilha com todas as entradas e saídas de grana.",
33: "É bom, também, guardar as notinhas para consultar depois. Aí você anota todos os gastos, casuais ou não, e deixa registrado para onde foi seu dinheiro.",
34: "HAHAH! Isso é o que nós vamos ver!",
35: "…Kim te ajudando é uma oportunidade única, okay?",
36: "De qualquer forma, vou tirar um cochilo. Enquanto isso, partiu testar os conhecimentos?",
    //Inicio cap 4
37: "\(Personagem.shared.nome!)...\nEu estava pensando, você guardou uma grana na poupança, né? Já pensou em investir em algo mais lucrativo?",
38: "Okay, essa explicação não foi a mais esclarecedora…",
39: "Diferente, ué. Só que um diferente melhor!",
40: "Enquanto na poupança o objetivo é juntar dinheiro, aqui a ideia é outra.\nÉ como colocar o seu dinheiro para trabalhar para você.",
41: "Na poupança, a gente gasta os rendimentos e o valor que já tínhamos aplicado.\nJá, quando investimos corretamente, usamos só os rendimentos, deixando o dinheiro aplicado rendendo sempre.",
42: "Vem cá que vamos entender isso melhor.", //Vai para a tela de banco
43: "Caso você esteja com uma graninha parada, recomendo que invista.\nNo futuro, faz toda a diferença!", //Volta para o fundo da faculdade
    //Inicio cap 5
44: "Se você é jovem ainda, jovem ainda, jovem ainda…\nAmanhã velho será, velho será, velho será!",
45: "A JUVENTUDE QUE NUNCA MORRERÁÁÁ!",
46: "…poxa, Kleytinho. Poxa.",
47: "Mas e você?",
48: "Mas não pode deixar de pensar nas coisas que vão te ajudar lá na frente, viu?",
49: "Naaah! Ainda tem muita preocupação pela frente.",
50: "Uma delas é a previdência.\nA previdência social é uma proteção cedida sob situações que podem comprometer a renda ou o trabalho de alguém.",
51: "Uma delas é a velhice! Mas também tem acidentes, doenças, prisão… e, no meu caso, a gravidez.",
52: "Esse benefício é concedido pelo Instituto Nacional do Seguro Social. O famoso INSS.\nPara se tornar um contribuinte, basta ter 16 anos ou mais.",
53: "Mas olha, essa não é a única forma de garantir uma aposentaria top!\nVocê também pode recorrer à previdência privada, que é basicamente o mesmo serviço, só que desvinculado do INSS.",
54: "Algumas empresas oferecem para seus funcionários, o que é um fornecimento fechado.",
55: "Mas também há o fornecimento aberto, onde você pode ir em qualquer banco ou corretora e começar a contribuir.",
56: "Já que você começou a investir recentemente, recomendo que fique só na previdência social.\nQuando você estiver com bastante grana, dá pra investir um pouquinho mais na previdência privada.",
57: "Esse é o espírito! Mas não esqueça que você quer comprar seu Celta.",
58: "É, você está certo. Uma coisa de cada vez.",
59: "Por enquanto, foque na sua… fila de metas.\nMas pequeno gafanhoto! Amanhã, você será um velho gafanhoto!\nPense no seu futuro também, sem atropelar os outros objetivos.",
    //Inicio cap 6
60: "Kleytinho… Hoje é um belo dia.\nOs pássaros estão cantando, o céu está ensolarado…\nE você precisa declarar seu imposto de renda.",//Narrador
61: "Hoje é um dia chato, sabe?",
62: "Vamos lá declarar esse negócio…",
63: "Não sabe o por quê? Bem, eu vou te mostrar.",
64: "O imposto de renda, como o nome já diz, é um imposto que é cobrado sobre o quanto você ganha.",
65: "Você precisa fazer uma declaração com toda, absolutamente toda a movimentação do seu dinheiro. Ou seja: seu salário, onde você mora, a faculdade, o plano de saúde que paga, o que guarda na poupança…",
66: "Isso serve para que a Receita Federal acompanhe o crescimento do seu patrimônio e, com base nisso, te cobre impostos proporcionais aos seus ganhos.",
67: "Eles fazem… muitas coisas.",
68: "Quê?!",
69: "O dinheiro vai para a saúde, educação e programas sociais no geral.\nÉ o que chamamos de dinheiro público!",
70: "E se você não declarar, vai ter que pagar uma multa.\n…Você não quer pagar essa multa, Kleytinho.",
71: "Então, vamos lá?!", //Vai para a simulação
    //Inicio cap 7
72: "Após um longo dia no trabalho e na faculdade, Kleytinho retorna.\nÉ um dia comum…\nMas um cheiro estranho.",
73: "O que está acontecendo?", //FALA DO KLEY KLEY
74: "Tá pegando fogo, bicho!!!", //FAUSTÃO
75: "Kleytinho!!! Eu não sei o que aconteceu… Os meninos estavam cozinhando e… e…", //Volta para kim
76: "Tá todo mundo desesperado… É a nossa casa! O que nós vamos fazer?",
77: "Todas as suas escolhas definiram nosso rumo até aqui.\nConfio em você.",
    //Mudar os valores dos finais com os dados do jogador
    //Cap 8.1 - dinheiro insuficiente
78: "Kleytinho…\nEsse foi o seu andamento até aqui.",
79: "Você tem <valor> na conta bancária. <valor> na conta corrente  e <valor> guardado na poupança.",
80: "Nos investimentos, você aplicou <valor>, que te rendeu <valor> de lucro.",
81: "Quanto às dívidas, você ficou com <valor> pendentes. <valor> são de contas essenciais, <valor> são da fatura.",
82: "Kleytinho, infelizmente, o dinheiro que você tem não vai poder nos ajudar.\nMas deixo marcada a minha gratidão!\nE, na próxima, não esqueça das dicas da Kim.",
    //Cap 8.2 - escolheu não ajudar
83: "Kleytinho…\nEsse foi o seu andamento até aqui.",
84: "Você tem <valor> na conta bancária. <valor> na conta corrente  e <valor> guardado na poupança.",
85: "Nos investimentos, você aplicou <valor>, que te rendeu <valor> de lucro.",
86: "Quanto às dívidas, você ficou com <valor> pendentes. <valor> são de contas essenciais, <valor> são da fatura.",
87: "Kleytinho… Você optou por não nos ajudar.\nMas sua grana também é insuficiente para comprar o Celta.",
88: "Eu respeito sua decisão, amigo. Mas, na próxima, guarde melhor o seu dinheiro.",
    //Cap 8.3 - Escolheu ajudar e tem dinheiro
89: "Kleytinho…\nEsse foi o seu andamento até aqui.",
90: "Você tem <valor> na conta bancária. <valor> na conta corrente  e <valor> guardado na poupança.",
91: "Nos investimentos, você aplicou <valor>, que te rendeu <valor> de lucro.",
92: "Quanto às dívidas, você ficou com <valor> pendentes. <valor> são de contas essenciais, <valor> são da fatura.",
93: "Kleytinho…\nGraças a você, conseguimos nos reestabelecer em um novo lugar!\nE sem prejudicar na nossa faculdade.",
94: "Obrigada! Graças à sua boa vontade e educação financeira, tudo ficou bem.",
95: "Não esqueça de manter a disciplina na vida real também, viu?",]

//Todas perguntas do jogo e as respostas possíveis em ordem
let per = [
    //Cap 1
1: "Partiu gastar tudo no bar?", 2: "É ISSO AÍ!", 3: "Não!!! Já tô atolado nas contas…", 4: " ",
5: "Você já sabe o que fazer com o dinheiro que recebeu, né?", 6: "Pagar as dívidas do cartão, né.", 7: "Acho que vou guardar um pouco…", 8: " ",
9: "Bora tomar um sorvete?", 10: "Opa!", 11: "Não posso, né…", 12: " ",
    //Cap 2
13: "Quanta coisa caaara!", 14: "Se passar no crédito, dá pra pagar", 15: "Se passar no débito, dá pra pagar", 16: " ",
17: "Lembra daquela sua fatura triste? Triste, triste fatura…", 18: "Não me lembra disso…", 19: "Realmente, está bem triste.", 20: " ",
    //Cap 3
21: "Você tá triste?", 22: "Sim."/*Preocupado com as contas*/, 23: "Eu não."/*Paguei a fatura! Preciso de mais nada!*/, 24: " ",
25: "Já pensou em bons hábitos?", 26: "Sim!"/*Colocar tudo nas mãos da Kim!*/, 27: "Para ser sincero, não.", 28: " ",
29: "Sua grana nunca mais vai sumir pro espaço!\nEntendeu?", 30: "Sim! Entendido.", 31: "Não entendi, não", 32: " ",
    //Cap 4
37: "Tipo uma poupança... Só que diferente.", 38: "Ué.", 39: "Diferente como?", 40: " ",
    //Cap 5
41: "A menos que…", 42: "…o coração, o coração sustente…", 43: "…você morra antes?", 44: " ",
45: "Em que fase da vida acha que está?", 46: "Jovem ainda, é claro.", 47: "Velho já sou.", 48: " ",
49: "O que você acha ?", 50: "Guardarei dinheiro para isso"/*Vou guardar bastante dinheiro para isso.*/, 51: "Quero focar na minha meta"/*Mas eu quero comprar meu celta logooo!*/, 52: " ",
    //Cap 6
53: "Eu não estou feliz com esse dia, sabe…", 54: "Sei, sim…", 55: "Ué, por quê?", 56: " ",
57: "Serve para que quem ganhe mais, contribua mais e quem ganha menos, contribua menos.", 58: "Para onde vai esse dinheiro ?", 59: "Não quero contribuir nada, não.", 60: " ",
    //Cap 7
61: "Kleytinho… O que você quer fazer?", 62: "Vou ajudar vocês!"/*Eu tenho dinheiro guardado, Kim. Vou ajudar vocês!*/, 63: "Desculpe... Não vou ajudar!", 64: " ",
65: "Pergunta 17", 66: "Resposta 1 p17", 67: "Resposta 2 p17", 68: "Resposta 3 p17",
69: "Pergunta 18", 70: "Resposta 1 p18", 71: "Resposta 2 p18", 72: "Resposta 3 p18",
73: "Pergunta 19", 74: "Resposta 1 p19", 75: "Resposta 2 p19", 76: "Resposta 3 p19",
77: "Pergunta 20", 78: "Resposta 1 p20", 79: "Resposta 2 p20", 80: "Resposta 3 p20",
81: "Pergunta 21", 82: "Resposta 1 p21", 83: "Resposta 2 p21", 84: "Resposta 3 p21",
85: "Pergunta 22", 86: "Resposta 1 p22", 87: "Resposta 2 p22", 88: "Resposta 3 p22",
89: "Pergunta 23", 90: "Resposta 1 p23", 91: "Resposta 2 p23", 92: "Resposta 3 p23",
93: "Pergunta 23", 94: "Resposta 1 p23", 95: "Resposta 2 p23", 96: "Resposta 3 p23",
97: "Pergunta 23", 98: "Resposta 1 p23", 99: "Resposta 2 p23", 100: "Resposta 3 p23",
101: "Pergunta 23", 102: "Resposta 1 p23", 103: "Resposta 2 p23", 104: "Resposta 3 p23",
105: "Pergunta 23", 106: "Resposta 1 p23", 107: "Resposta 2 p23", 108: "Resposta 3 p23",
109: "Pergunta 23", 110: "Resposta 1 p23", 111: "Resposta 2 p23", 112: "Resposta 3 p23",
113: "Pergunta 23", 114: "Resposta 1 p23", 115: "Resposta 2 p23", 116: "Resposta 3 p23",
117: "Pergunta 23", 118: "Resposta 1 p23", 119: "Resposta 2 p23", 120: "Resposta 3 p23",
121: "Pergunta 23", 122: "Resposta 1 p23", 123: "Resposta 2 p23", 124: "Resposta 3 p23",
125: "Pergunta 23", 126: "Resposta 1 p23", 127: "Resposta 2 p23", 128: "Resposta 3 p23",
129: "Pergunta 23", 130: "Resposta 1 p23", 131: "Resposta 2 p23", 132: "Resposta 3 p23",
133: "Pergunta 23", 134: "Resposta 1 p23", 135: "Resposta 2 p23", 136: "Resposta 3 p23",
137: "Pergunta 23", 138: "Resposta 1 p23", 139: "Resposta 2 p23", 140: "Resposta 3 p23",
141: "Pergunta 23", 142: "Resposta 1 p23", 143: "Resposta 2 p23", 144: "Resposta 3 p23",
145: "Pergunta 23", 146: "Resposta 1 p23", 147: "Resposta 2 p23", 148: "Resposta 3 p23",
149: "Pergunta 23", 150: "Resposta 1 p23", 151: "Resposta 2 p23", 152: "Resposta 3 p23",
153: "Pergunta 23", 154: "Resposta 1 p23", 155: "Resposta 2 p23", 156: "Resposta 3 p23",
157: "Pergunta 23", 158: "Resposta 1 p23", 159: "Resposta 2 p23", 160: "Resposta 3 p23",
]


//Todas as explicações presentes nas fases
let help = [
"Ajuda 1 p1", "Ajuda 2 p1", "Ajuda 3 p1",
"Ajuda 1 p2", "Ajuda 2 p2", "Ajuda 3 p2",
"Ajuda 1 p3", "Ajuda 2 p3", "Ajuda 3 p3",
"Ajuda 1 p4", "Ajuda 2 p4", "Ajuda 3 p4",
"Ajuda 1 p5", "Ajuda 2 p5", "Ajuda 3 p5",
"Ajuda 1 p6", "Ajuda 2 p6", "Ajuda 3 p6",
"Ajuda 1 p7", "Ajuda 2 p7", "Ajuda 3 p7",
"Ajuda 1 p8", "Ajuda 2 p8", "Ajuda 3 p8",
"Ajuda 1 p9", "Ajuda 2 p9", "Ajuda 3 p9",
"Ajuda 1 p10", "Ajuda 2 p10", "Ajuda 3 p10",
"Ajuda 1 p11", "Ajuda 2 p11", "Ajuda 3 p11",
"Ajuda 1 p12", "Ajuda 2 p12", "Ajuda 3 p12",
"Ajuda 1 p13", "Ajuda 2 p13", "Ajuda 3 p13",
"Ajuda 1 p14", "Ajuda 2 p14", "Ajuda 3 p14",
"Ajuda 1 p15", "Ajuda 2 p15", "Ajuda 3 p15",
"Ajuda 1 p16", "Ajuda 2 p16", "Ajuda 3 p16",
"Ajuda 1 p17", "Ajuda 2 p17", "Ajuda 3 p17",
"Ajuda 1 p18", "Ajuda 2 p18", "Ajuda 3 p18",
"Ajuda 1 p19", "Ajuda 2 p19", "Ajuda 3 p19",
"Ajuda 1 p20", "Ajuda 2 p20", "Ajuda 3 p20",
"Ajuda 1 p21", "Ajuda 2 p21", "Ajuda 3 p21",
"Ajuda 1 p22", "Ajuda 2 p22", "Ajuda 3 p22",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
]
var prog = 7 // Representa o progresso do jogador
//Arrays que definem o posicionamento das perguntas durante os dialogos
//Casa 0: Fala inicial; Casa 1: Última fala antes da primeira pergunta; Casa 2: Última casa antes da segunda pergunta...
//Colocar 0 caso já tenha acabado
var q = Array(repeating: 0, count:6)
var q1 = [1, 2, 5, 9, 12, 0]
var q2 = [13, 14, 18, 22, 0, 0]
var q3 = [23, 23, 26, 33, 36, 0]
var q4 = [37, 37, 43, 0, 0, 0]
var q5 = [44, 44, 47, 56, 59, 0]
var q6 = [60, 61, 66, 71, 0, 0]
var q7 = [72, 76, 76 , 77, 0, 0]
var q81 = [78, 82, 0, 0, 0, 0]
var q82 = [83, 88, 0, 0, 0, 0]
var q83 = [89, 95, 0, 0, 0, 0]

//Arrays que salvarão as respostas
var resposta1 = Array(repeating: 0, count:3)
var resposta2 = Array(repeating: 0, count:2)
var resposta3 = Array(repeating: 0, count:3)
var resposta4 = Array(repeating: 0, count:1)
var resposta5 = Array(repeating: 0, count:3)
var resposta6 = Array(repeating: 0, count:2)
var resposta7 = Array(repeating: 0, count:1)
