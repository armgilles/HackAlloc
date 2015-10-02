ECHO_SUCCESS=@echo " \033[1;32m✔\033[0m  "

all: install download_commune data_commune

install:
	#pip install -r requirements.txt
	#@rm -rf data
	#@mkdir data

download_commune:
	# RSA : http://data.caf.fr/dataset/foyers-allocataires-percevant-le-revenu-de-solidarite-active-rsa-par-commune
	@wget -O source/by_commune/RSACom2009.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2009.csv
	@wget -O source/by_commune/RSACom2010.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2010.csv
	@wget -O source/by_commune/RSACom2011.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2011.csv
	@wget -O source/by_commune/RSACom2012.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2012.csv
	@wget -O source/by_commune/RSACom2013.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2013.csv
	@wget -O source/by_commune/RSACom2014.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2014.csv

	# PAJE : 
	@wget -O source/by_commune/PAJECom2009.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/41936fac-2bb5-4f64-8670-1286467fa306/download/PAJECom2009.csv
	@wget -O source/by_commune/PAJECom2010.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/41936fac-2bb5-4f64-8670-1286467fa306/download/PAJECom2010.csv
	@wget -O source/by_commune/PAJECom2011.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/41936fac-2bb5-4f64-8670-1286467fa306/download/PAJECom2011.csv
	@wget -O source/by_commune/PAJECom2012.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/41936fac-2bb5-4f64-8670-1286467fa306/download/PAJECom2012.csv
	@wget -O source/by_commune/PAJECom2013.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/41936fac-2bb5-4f64-8670-1286467fa306/download/PAJECom2013.csv
	@wget -O source/by_commune/PAJECom2014.csv http://data.caf.fr/dataset/23f79fd1-a59c-4a9a-91e5-717f126cb166/resource/41936fac-2bb5-4f64-8670-1286467fa306/download/PAJECom2014.csv


data_commune:
	python get_by_year.py
	python insee_agg_commune.py	