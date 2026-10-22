@echo off
setlocal
echo Bitcoin Turmalina BTURM - auxiliar de compilacao
echo.
if exist "C:\msys64\msys2_shell.cmd" (
  echo MSYS2 encontrado em C:\msys64.
  echo Este codigo legado exige toolchain e dependencias do projeto configuradas.
  echo Consulte INSTALL.md e BITCOIN_TURMALINA_README.md.
  start "" "C:\msys64\msys2_shell.cmd" -mingw64
  exit /b 0
)
echo ERRO: MSYS2 nao encontrado em C:\msys64.
echo Instale/configure o ambiente de compilacao descrito em INSTALL.md.
echo Este BAT nao finge compilar: sem compilador e dependencias nao existe EXE gerado.
pause
exit /b 1
