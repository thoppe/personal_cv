#current = prof_ref_contacts
#current = prof_rs
#current = prof_rs_exec

#current = travis_academia_cv
#current = cara_resume
#current = travis_teaching_philosophy
#current = travis_curriculum_contribution
current = travis_publication_list

all:
	@make check
	make $(current)
	evince pdf/$(current).pdf & 2>/dev/null 

master:
	make prof_ts 
	make prof_rs
	make travis

$(current):
	pdflatex -output-directory pdf $(current).tex

travis_publication_list:
	pdflatex -output-directory pdf travis_publication_list.tex
	cp bibliography/*.bib pdf
	cd pdf; bibtex travis_publication_list
	pdflatex -output-directory pdf travis_publication_list.tex

travis_academia_cv:
	pdflatex -output-directory pdf travis_academia_cv.txe

travis_teaching_philosophy:
	pdflatex -output-directory pdf travis_teaching_philosophy.tex

travis_curriculum_contribution:
	pdflatex -output-directory pdf travis_curriculum_contribution.tex

cara_resume:
	pdflatex -output-directory pdf cara_resume.tex

edit:
	emacs $(current).tex &

check:
	aspell -t -c $(current).tex

bib:
	pdflatex $(current).tex
	bibtex $(current)
	pdflatex $(current).txe
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
