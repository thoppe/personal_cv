#current = prof_ts
#current = prof_curr_con
#current = prof_ref_contacts
#current = prof_rs
#current = prof_rs_exec
current = travis
#current = cara
#current = pub_list

all:
	@make check
	make $(current)
	evince $(current).pdf & 2>/dev/null 

master:
	make prof_ts 
	make prof_rs
	make travis

edit:
	emacs $(current).tex &

$(current):
	pdflatex $(current).tex

check:
	aspell -t -c $(current).tex

bib:
	pdflatex $(current).tex
	bibtex $(current)
	pdflatex $(current).tex
	evince $(current).pdf & 2>/dev/null 

clean:
	rm -vf *.aux *.log *~ *.out *.pdf *.blg *.xml *.bbl
	rm -vfr auto/

push:
	git commit -a
	git push

commit:
	make push
