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

	# TrancheAge : http://data.caf.fr/dataset/denombrement-et-repartition-des-foyers-allocataires-selon-l-age-du-responsable
	@wget -O source/TrancheAge2009.csv	http://data.caf.fr/dataset/d52a5176-195f-47c0-a851-b652e1d2875c/resource/3b326055-b1b5-4aa3-a4d2-18e895cb7e7d/download/trancheage2009.csv
	@wget -O source/TrancheAge2010.csv	http://data.caf.fr/dataset/d52a5176-195f-47c0-a851-b652e1d2875c/resource/8137ac83-32ca-48e4-a23e-d8f6263601fc/download/trancheage2010.csv
	@wget -O source/TrancheAge2011.csv	http://data.caf.fr/dataset/d52a5176-195f-47c0-a851-b652e1d2875c/resource/02dc20f2-3a3d-4272-9893-07912fe563fd/download/trancheage2011.csv
	@wget -O source/TrancheAge2012.csv	http://data.caf.fr/dataset/d52a5176-195f-47c0-a851-b652e1d2875c/resource/0f9dd215-eb6d-4479-90e0-0b0d951d5dec/download/trancheage2012.csv
	@wget -O source/TrancheAge2013.csv	http://data.caf.fr/dataset/d52a5176-195f-47c0-a851-b652e1d2875c/resource/a6283267-9635-4452-b30e-35fe8a5cdbe2/download/trancheage2013.csv
	@wget -O source/TrancheAge2014.csv	http://data.caf.fr/dataset/d52a5176-195f-47c0-a851-b652e1d2875c/resource/b46e67ea-66f9-4855-bc01-70690c1809dd/download/trancheage2014.csv

	# LOGCom : http://data.caf.fr/dataset/population-des-foyers-allocataires-percevant-une-aide-personnelle-au-logement
	@wget -O source/LOGCom2009.csv	http://data.caf.fr/dataset/1263e313-9bb0-417d-bb88-1488b6993ae8/resource/e8d57800-dd95-4221-b4d8-2044ba67cbcb/download/LOGCom2009.csv
	@wget -O source/LOGCom2010.csv	http://data.caf.fr/dataset/1263e313-9bb0-417d-bb88-1488b6993ae8/resource/6108a4d5-26e8-4f25-9f49-6a8da58ea6ae/download/LOGCom2010.csv
	@wget -O source/LOGCom2011.csv	http://data.caf.fr/dataset/1263e313-9bb0-417d-bb88-1488b6993ae8/resource/5867d5ab-190d-40c8-8f4d-b7eb9dc1fc8e/download/LOGCom2011.csv
	@wget -O source/LOGCom2012.csv	http://data.caf.fr/dataset/1263e313-9bb0-417d-bb88-1488b6993ae8/resource/8566dd5b-b9db-4e67-89a1-c10e62b703a8/download/LOGCom2012.csv
	@wget -O source/LOGCom2013.csv	http://data.caf.fr/dataset/1263e313-9bb0-417d-bb88-1488b6993ae8/resource/21eab4ce-9ad3-4346-8efe-cb994f2a7011/download/LOGCom2013.csv
	@wget -O source/LOGCom2014.csv	http://data.caf.fr/dataset/1263e313-9bb0-417d-bb88-1488b6993ae8/resource/37ba7456-0996-4c95-ba28-38f079d25d86/download/LOGCom2014.csv

data_commune:
	@cd by_commune
	python DependancePrestaCom.py
	python BasrevnuCom.py
	python NivComTotal.py
	python ConfigFamiliale.py
	python TrancheAge.py