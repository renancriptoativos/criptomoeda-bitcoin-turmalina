# Bitcoin Turmalina (BTURM) — protótipo fonte

Parâmetros aplicados nesta revisão:
- Nome reportado pelo cliente: Bitcoin Turmalina
- Símbolo: BTURM (a interface/protocolo original ainda pode conter strings antigas)
- Porta P2P da rede principal: 1097
- Subsídio por bloco: 10.000 BTURM
- Limite de alvo de prova de trabalho ajustado para facilitar a mineração inicial (não representa uma dificuldade fixa exata de 0,0001).

## Importante
Este projeto deriva de um cliente But/Dash antigo. A alteração de subsídio não cria, sozinha, um limite rígido de emissão de 210.000.000.000.000 BTURM; para isso é necessário implementar e testar um limite cumulativo de emissão e recalcular/validar o bloco gênese e parâmetros de consenso. O bloco gênese foi mantido para preservar as verificações de hash existentes. Portanto, trate esta revisão como protótipo de desenvolvimento, não como uma rede pronta para uso com fundos reais.

## Compilar no Windows
O ZIP inclui `COMPILAR_WINDOWS.bat`, um auxiliar que verifica a presença do ambiente MSYS2 e abre um shell de compilação. A compilação deste código legado requer o ambiente de dependências do projeto (autotools, compilador C++, Qt e bibliotecas); não é possível produzir um EXE Windows confiável neste ambiente Linux sem essas dependências. Consulte `INSTALL.md` e a documentação de compilação do projeto antes de publicar uma rede.
