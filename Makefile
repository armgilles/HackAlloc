ECHO_SUCCESS=@echo " \033[1;32m✔\033[0m  "

all: install download_commune data_commune

install:
	#pip install -r requirements.txt
	@rm -rf source
	@mkdir source
	@cd source && mkdir by_commune
	#@rm -rf data
	#@mkdir data
	#cd data && mkdir by_commune

download_commune:
	# RSA : http://data.caf.fr/dataset/foyers-allocataires-percevant-le-revenu-de-solidarite-active-rsa-par-commune
	@wget -O source/by_commune/RSACom2009.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2009.csv
	@wget -O source/by_commune/RSACom2010.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2010.csv
	@wget -O source/by_commune/RSACom2011.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2011.csv
	@wget -O source/by_commune/RSACom2012.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2012.csv
	@wget -O source/by_commune/RSACom2013.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2013.csv
	@wget -O source/by_commune/RSACom2014.csv http://data.caf.fr/dataset/b2b4d0bf-faf4-453f-bdb8-66e203b114c8/resource/99ddd753-a3c3-4e8a-8ddf-f58ad778b33a/download/RSACom2014.csv




data_commune:
	@cd by_commune
	