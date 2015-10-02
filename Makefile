ECHO_SUCCESS=@echo " \033[1;32m✔\033[0m  "

all: install download

install:
	#pip install -r requirements.txt
	@rm -rf source
	@mkdir source
	@cd source && mkdir by_commune
	#@rm -rf data
	#@mkdir data
	cd data && mkdir by_commune

download_commune:
	#Indicateur sur la part des prestations dans les ressources des foyers allocataires
	@wget -O source/by_commune/DependancePrestaCom2009.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2009.csv
	@wget -O source/by_commune/DependancePrestaCom2010.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2010.csv
	@wget -O source/by_commune/DependancePrestaCom2011.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2011.csv
	@wget -O source/by_commune/DependancePrestaCom2012.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2012.csv
	@wget -O source/by_commune/DependancePrestaCom2013.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2013.csv
	@wget -O source/by_commune/DependancePrestaCom2014.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2014.csv

data_commune:
	python by_commune/DependancePrestaCom.py
