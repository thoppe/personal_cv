#current = prof_ts
#current = prof_curr_con
#current = prof_ref_contacts
#current = prof_rs
#current = prof_rs_exec

#current = pub_list

current = travis_academia_cv
#current = cara_resume

all:
	@make check
	make $(current)
	evince pdf/$(current).pdf & 2>/dev/null 

master:
	make prof_ts 
	make prof_rs
	make travis

$(current):
	pdflatex $(current).tex

travis_academia_cv:
	pdflatex -output-directory pdf travis_academia_cv.tex

cara_resume:
	pdflatex -output-directory pdf cara_resume.tex

edit:
	emacs $(current).tex &

check:
	aspell -t -c $(current).tex

bib:
	pdflatex $(current).tex
	bibtex $(current)
	pdflatex $(current).tex
	evince $(current).pdf & 2>/dev/null 

clean:
	find . -name "*~" -exec rm -vf {} \;
	find pdf ! -iname "README.md" -type f -exec rm -vf {} +
	rm -vfr auto/

push:
	git commit -a
	git push

commit:
	make push
