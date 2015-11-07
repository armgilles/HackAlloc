ECHO_SUCCESS=@echo " \033[1;32m✔\033[0m  "

all: install download_commune data_commune

install:
	#pip install -r requirements.txt
	#@rm -rf data
	#@mkdir data

download_commune:
	# RSA : http://data.caf.fr/dataset/foyers-allocataires-percevant-le-revenu-de-solidarite-active-rsa-par-commune
	@wget -O source/by_commune/RSACom2009.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2009.csv
	@wget -O source/by_commune/RSACom2010.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/cd443296-2f52-4fd9-a40d-b2b6ec3b179e/download/RSACom2010.csv
	@wget -O source/by_commune/RSACom2011.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/1ea185d6-2c00-4ea5-8228-bb25e32dfcca/download/RSACom2011.csv
	@wget -O source/by_commune/RSACom2012.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/23ff16f4-8d89-4012-b50a-ca473edffdab/download/RSACom2012.csv
	@wget -O source/by_commune/RSACom2013.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/f86c1d62-9fae-4cd2-9034-36a4d81f601e/download/RSACom2013.csv
	@wget -O source/by_commune/RSACom2014.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/4c405f7f-a0ac-4d56-b836-c386e38c8c39/download/RSACom2014.csv

	# PAJE : 
	@wget -O source/by_commune/PAJECom2009.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/41936fac-2bb5-4f64-8670-1286467fa306/download/PAJECom2009.csv
	@wget -O source/by_commune/PAJECom2010.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/d49e20a3-d3e8-4a3d-a239-fed7c2a00da6/download/PAJECom2010.csv
	@wget -O source/by_commune/PAJECom2011.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/06cec282-cdf6-40a7-8e26-ba611eb71ea6/download/PAJECom2011.csv
	@wget -O source/by_commune/PAJECom2012.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/d0903f8c-027a-4a06-963d-f56d93e84c4a/download/PAJECom2012.csv
	@wget -O source/by_commune/PAJECom2013.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/05152e2d-0d49-4245-8b41-4c4be74a6226/download/PAJECom2013.csv
	@wget -O source/by_commune/PAJECom2014.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/cc73587b-8e69-4c42-90aa-488b9ef168dd/download/PAJECom2014.csv


data_commune:
	python merging_insee_city.py			# Create ref_pop.csv & commune_insee.csv
	python get_by_year.py 					# Create caf_YEAR.csv
	python cluster_kmean_city.py 			# Create ref_com_cluster.csv
	python merging_caf_cluster_com.py  		# Graph & create fichier metric distance aide caf sur cluster com 
