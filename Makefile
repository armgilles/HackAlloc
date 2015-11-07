ECHO_SUCCESS=@echo " \033[1;32m✔\033[0m  "

all: install download_commune data_commune

install:
	#pip install -r requirements.txt
	@rm -rf source
	@mkdir source
	@rm -rf data
	@mkdir data

download_commune:
	# DependancePrestaCom : http://data.caf.fr/dataset/indicateur-sur-la-part-des-prestations-dans-les-ressources-des-foyers-allocataires-par-commune
	@wget -O source/DependancePrestaCom2009.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2009.csv
	@wget -O source/DependancePrestaCom2010.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2010.csv
	@wget -O source/DependancePrestaCom2011.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2011.csv
	@wget -O source/DependancePrestaCom2012.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2012.csv
	@wget -O source/DependancePrestaCom2013.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2013.csv
	@wget -O source/DependancePrestaCom2014.csv http://data.caf.fr/dataset/87fd090b-956a-4d57-b8eb-c03b08f22b4c/resource/75189698-90ce-44f7-aa4f-aa4e23161010/download/DependancePrestaCom2014.csv

	# BasrevnuCom : http://data.caf.fr/dataset/beneficiaire-bas-revenus
	@wget -O source/BasrevenuCom2009.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2009.csv
	@wget -O source/BasrevenuCom2010.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2010.csv
	@wget -O source/BasrevenuCom2011.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2011.csv
	@wget -O source/BasrevenuCom2012.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2012.csv
	@wget -O source/BasrevenuCom2013.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2013.csv
	@wget -O source/BasrevenuCom2014.csv http://data.caf.fr/dataset/79250fae-53f6-4d7c-91da-218e79bdcb60/resource/c51b0621-9b2a-4031-9859-553b06731ec3/download/BasrevenuCom2014.csv

	# NIVCOMTOTAL2009 : http://data.caf.fr/dataset/population-des-foyers-allocataires-par-commune/resource/dfc08b49-20fe-4a58-8e3f-96cfa3f02e2c
	@wget -O source/NivComTotal2009.csv http://data.caf.fr/dataset/32cc7f8a-f15a-4372-b862-dcb247b1bfb6/resource/dfc08b49-20fe-4a58-8e3f-96cfa3f02e2c/download/NIVCOMTOTAL2009.csv
	@wget -O source/NivComTotal2010.csv http://data.caf.fr/dataset/32cc7f8a-f15a-4372-b862-dcb247b1bfb6/resource/dfc08b49-20fe-4a58-8e3f-96cfa3f02e2c/download/NIVCOMTOTAL2010.csv
	@wget -O source/NivComTotal2011.csv http://data.caf.fr/dataset/32cc7f8a-f15a-4372-b862-dcb247b1bfb6/resource/dfc08b49-20fe-4a58-8e3f-96cfa3f02e2c/download/NIVCOMTOTAL2011.csv
	@wget -O source/NivComTotal2012.csv http://data.caf.fr/dataset/32cc7f8a-f15a-4372-b862-dcb247b1bfb6/resource/dfc08b49-20fe-4a58-8e3f-96cfa3f02e2c/download/NIVCOMTOTAL2012.csv
	@wget -O source/NivComTotal2013.csv http://data.caf.fr/dataset/32cc7f8a-f15a-4372-b862-dcb247b1bfb6/resource/dfc08b49-20fe-4a58-8e3f-96cfa3f02e2c/download/NIVCOMTOTAL2013.csv
	@wget -O source/NivComTotal2014.csv http://data.caf.fr/dataset/32cc7f8a-f15a-4372-b862-dcb247b1bfb6/resource/dfc08b49-20fe-4a58-8e3f-96cfa3f02e2c/download/NIVCOMTOTAL2014.csv

	# ConfigFamiliale : http://data.caf.fr/dataset/repartition-des-foyers-allocataires-selon-le-type-de-famille-par-communem
	@wget -O source/ConfigFamiliale2009.csv	http://data.caf.fr/dataset/55b512d5-fc90-41ff-9908-47b41d0599a3/resource/59ea1a6a-a02b-4b3d-bfed-ccf17db2048c/download/configfamiliale2009.csv
	@wget -O source/ConfigFamiliale2010.csv	http://data.caf.fr/dataset/55b512d5-fc90-41ff-9908-47b41d0599a3/resource/59ea1a6a-a02b-4b3d-bfed-ccf17db2048c/download/configfamiliale2010.csv
	@wget -O source/ConfigFamiliale2011.csv	http://data.caf.fr/dataset/55b512d5-fc90-41ff-9908-47b41d0599a3/resource/59ea1a6a-a02b-4b3d-bfed-ccf17db2048c/download/configfamiliale2011.csv
	@wget -O source/ConfigFamiliale2012.csv	http://data.caf.fr/dataset/55b512d5-fc90-41ff-9908-47b41d0599a3/resource/59ea1a6a-a02b-4b3d-bfed-ccf17db2048c/download/configfamiliale2012.csv
	@wget -O source/ConfigFamiliale2013.csv	http://data.caf.fr/dataset/55b512d5-fc90-41ff-9908-47b41d0599a3/resource/59ea1a6a-a02b-4b3d-bfed-ccf17db2048c/download/configfamiliale2013.csv
	@wget -O source/ConfigFamiliale2014.csv	http://data.caf.fr/dataset/55b512d5-fc90-41ff-9908-47b41d0599a3/resource/59ea1a6a-a02b-4b3d-bfed-ccf17db2048c/download/configfamiliale2014.csv


data_commune:
	@cd by_commune
	python DependancePrestaCom.py
	python BasrevnuCom.py
	python NivComTotal.py
	python ConfigFamiliale.py