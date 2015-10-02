ECHO_SUCCESS=@echo " \033[1;32m✔\033[0m  "

all: install download_commune

install:
	#pip install -r requirements.txt
	@rm -rf source
	@mkdir source
	@cd source && mkdir by_commune
	#@rm -rf data
	#@mkdir data
	#cd data && mkdir by_commune

download_commune:
	# DependancePrestaCom : http://data.caf.fr/dataset/indicateur-sur-la-part-des-prestations-dans-les-ressources-des-foyers-allocataires-par-commune
	@wget -O source/by_commune/DependancePrestaCom2009.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2009.csv
	@wget -O source/by_commune/DependancePrestaCom2010.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2010.csv
	@wget -O source/by_commune/DependancePrestaCom2011.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2011.csv
	@wget -O source/by_commune/DependancePrestaCom2012.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2012.csv
	@wget -O source/by_commune/DependancePrestaCom2013.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2013.csv
	@wget -O source/by_commune/DependancePrestaCom2014.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2014.csv

	# BasrevnuCom : http://data.caf.fr/dataset/beneficiaire-bas-revenus
	@wget -O source/by_commune/BasrevenuCom2009.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2009.csv
	@wget -O source/by_commune/BasrevenuCom2010.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2010.csv
	@wget -O source/by_commune/BasrevenuCom2011.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2011.csv
	@wget -O source/by_commune/BasrevenuCom2012.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2012.csv
	@wget -O source/by_commune/BasrevenuCom2013.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2013.csv
	@wget -O source/by_commune/BasrevenuCom2014.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2014.csv



data_commune:
	python by_commune/DependancePrestaCom.py
	python by_commune/BasrevnuCom.py
