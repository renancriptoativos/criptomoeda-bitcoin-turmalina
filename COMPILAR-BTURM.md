# Como compilar a Bitcoin Turmalina Core (BTURM)

Este repositorio ja esta renomeado (binarios `bitcointurmalinad`,
`bitcointurmalina-cli`, `bitcointurmalina-tx`, `bitcointurmalina-qt`) e com uma
rede independente (bloco genese, magic bytes, portas e prefixos de endereco
proprios). Abaixo estao as formas de gerar os executaveis.

## Opcao A — GitHub Actions (recomendada, nao precisa de ambiente local)

Foi incluido o workflow `.github/workflows/release.yml`, que compila para
**Windows 64-bit** e **Linux 64-bit** e disponibiliza os executaveis para
download.

1. Suba este repositorio para o seu GitHub.
2. Rode de uma das formas:
   - Manual: aba **Actions** -> **Build Release Binaries** -> **Run workflow**.
   - Por tag (gera tambem uma Release com os arquivos anexados):
     ```
     git tag v1.14.99
     git push origin v1.14.99
     ```
3. Ao terminar, baixe os pacotes em **Actions -> (execucao) -> Artifacts**:
   - `bitcointurmalina-x86_64-win.zip`
   - `bitcointurmalina-x86_64-linux.tar.gz`

> A primeira execucao demora (compila as dependencias via `depends/`). As
> execucoes seguintes usam cache e sao bem mais rapidas.

## Opcao B — Compilar localmente no Linux (x86_64)

Requisitos (Ubuntu/Debian):
```
sudo apt-get update
sudo apt-get install -y build-essential libtool autotools-dev automake \
     pkg-config bsdmainutils curl ca-certificates ccache git python3
```

Build usando o sistema `depends` (gera dependencias estaticas):
```
make -j"$(nproc)" -C depends HOST=x86_64-unknown-linux-gnu
./autogen.sh
./configure --prefix="$(pwd)/depends/x86_64-unknown-linux-gnu" \
            --with-gui=qt5 --enable-reduce-exports
make -j"$(nproc)"
```
Os executaveis ficam em `src/`:
`bitcointurmalinad`, `bitcointurmalina-cli`, `bitcointurmalina-tx` e
`src/qt/bitcointurmalina-qt`.

## Opcao C — Windows cruzado (mingw) a partir do Linux
```
sudo apt-get install -y g++-mingw-w64-x86-64 nsis
sudo update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix
sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
make -j"$(nproc)" -C depends HOST=x86_64-w64-mingw32
./autogen.sh
./configure --prefix="$(pwd)/depends/x86_64-w64-mingw32" --enable-gui=qt5 --enable-reduce-exports
make -j"$(nproc)"
```
Gera os `.exe` correspondentes em `src/` e `src/qt/`.

## Primeiros passos ao rodar a rede

Como esta e uma rede NOVA e independente, nao existem nos publicos. Para testar:

- Rede de regressao (local, instantanea):
  ```
  ./src/bitcointurmalinad -regtest -daemon
  ./src/bitcointurmalina-cli -regtest generate 10
  ```
- Rede principal/teste: rode dois ou mais nos e conecte-os manualmente com
  `-addnode=IP` (ou configure suas proprias DNS seeds no codigo antes de
  compilar). As portas padrao sao: principal 33556, teste 45556, regtest 19444.

## Parametros desta rede (resumo)

| Item                  | Principal | Teste  | Regtest |
|-----------------------|-----------|--------|---------|
| Porta P2P padrao      | 33556     | 45556  | 19444   |
| Magic bytes           | d5 42 54 4d | d6 42 54 4d | d7 42 54 4d |
| Prefixo de endereco   | 'B'       | 't'    | 't'     |

O bloco genese foi re-minerado (PoW scrypt valido) com a mensagem
"Bitcoin Turmalina 15/Oct/2026 rede independente BTURM".
