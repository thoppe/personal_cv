current = OPA_DPCPSI_text_mining

all:
	@make check
	make $(current)
	evince pdf/$(current).pdf & 2>/dev/null 

master:
	make OPA_DPCPSI_text_mining

OPA_DPCPSI_text_mining:
	pdflatex -output-directory pdf OPA_DPCPSI_text_mining.tex

edit:
	emacs $(current).tex &

check:
	aspell -t -c $(current).tex

clean:
	find . -name "*~" -exec rm -vf {} \;
	find pdf ! -iname "README.md" ! -iname *.pdf -type f -exec rm -vf {} +
	rm -vfr auto/

full_clean:
	find . -name "*~" -exec rm -vf {} \;
	find pdf ! -iname "README.md" -type f -exec rm -vf {} +
	rm -vfr auto/

push:
	git commit -a
	git push

commit:
	make push
