git checkout gh-pages

pretty_doc -t default -o ./examples/default README.md
pretty_doc -t bootstrap -o ./examples/bootstrap README.md
pretty_doc -t parallel -o ./examples/parallel README.md

pretty_doc -t parallel README.md -o .

mv README.html index.html

git checkout master
