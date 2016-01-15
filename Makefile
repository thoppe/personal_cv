#current = cara_resume
current = travis_academia_cv
#current = travis_teaching_philosophy
#current = travis_curriculum_contribution
#current = travis_publication_list
#current = travis_academia_contacts
#current = travis_research_statment_exec
#current = travis_research_statment
#current = travis_professional_resume
#current = travis_cover_letter_OPA

all:
	@make check
	make $(current)
	evince pdf/$(current).pdf & 2>/dev/null 

master:
	make travis_academia_cv
	make travis_teaching_philosophy
	make travis_curriculum_contribution
	make travis_publication_list
	make travis_academia_contacts
	make travis_research_statment_exec
	make travis_research_statment

travis_cover_letter_OPA:
	pdflatex -output-directory pdf travis_cover_letter_OPA.tex

travis_publication_list:
	pdflatex -output-directory pdf travis_publication_list.tex
	cp bibliography/*.bib pdf
	cd pdf; bibtex travis_publication_list
	pdflatex -output-directory pdf travis_publication_list.tex

travis_academia_cv:
	pdflatex -output-directory pdf travis_academia_cv.tex

travis_professional_resume:
	pdflatex -output-directory pdf travis_professional_resume.tex

travis_academia_contacts:
	pdflatex -output-directory pdf travis_academia_contacts.tex

travis_research_statment_exec:
	pdflatex -output-directory pdf travis_research_statment_exec

travis_research_statment:
	pdflatex -output-directory pdf travis_research_statment

travis_teaching_philosophy:
	pdflatex -output-directory pdf travis_teaching_philosophy.tex

travis_curriculum_contribution:
	pdflatex -output-directory pdf travis_curriculum_contribution.tex

cara_resume:
	pdflatex -output-directory pdf cara_resume.tex

edit:
	emacs $(current).tex &

edit_bib:
	emacs bibliography/travis_hoppe_publications.bib &

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
