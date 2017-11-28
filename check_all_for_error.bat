@echo off
set current=%cd%
del log_compilazione_latex.txt >NUL 2>NUL
echo -------------------------------------------------------------
echo -          Inizio analisi dei documenti presenti!           -
echo -------------------------------------------------------------
for /D /R %%p in (.) do (
	cd %%p
	for %%f in (*.tex) do (
		>>%current%\log_compilazione_latex.txt (
			pdflatex -interaction=nonstopmode -draftmode -aux-directory %temp% "%%f"
		)
		if not "%errorlevel%" == "0" (
			goto :error
		)
	)
)

echo -------------------------------------------------------------
echo -     Analisi completata, leggere il log per i risultati!   -
echo -------------------------------------------------------------
goto :exit

:error

echo -------------------------------------------------------------
echo -      ERRORE CRITICO! IMPOSSIBILE ANALIZZARE I FILE        -
echo -------------------------------------------------------------

:exit
cd %current%
pause
