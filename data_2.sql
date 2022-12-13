CREATE TABLE STATION(
	station_id NUMBER(16) NOT NULL,
	name       VARCHAR2(32),
	
	CONSTRAINT pk_station
		PRIMARY KEY (station_id)
);
CREATE TABLE ZUGVERBINDUNG(
	zugverbindungs_id NUMBER(16) NOT NULL,
	
	CONSTRAINT pk_zugverbindung
		PRIMARY KEY (zugverbindungs_id)
);
CREATE TABLE STATION_HAT_ZUGVERBINDUNG(
	station_id        NUMBER(16) NOT NULL,
	zugverbindungs_id NUMBER(16) NOT NULL,
	
	abfahrts_zeit TIMESTAMP,
	ankunfts_zeit TIMESTAMP,
	
	fearth_durch  NUMBER(1),
	
	CONSTRAINT fk_station_hat_zugverbindung
		FOREIGN KEY (station_id)
		REFERENCES STATION(station_id),
	CONSTRAINT fk_zugverbindun_hat_stationen
		FOREIGN KEY (zugverbindungs_id)
		REFERENCES ZUGVERBINDUNG(zugverbindungs_id)
);

CREATE TABLE ZUEGE(
	zuege_id NUMBER(16) NOT NULL,
	name     VARCHAR2(32),
	
	CONSTRAINT pk_zuege
		PRIMARY KEY (zuege_id)
);
CREATE TABLE ZUGVERBINDUNG_HAT_ZUEGE(
	zugverbindungs_id NUMBER(16) NOT NULL,
	zuege_id          NUMBER(16) NOT NULL,
	
	CONSTRAINT fk_zugverbindung_hat_zuege
		FOREIGN KEY (zugverbindungs_id)
		REFERENCES ZUGVERBINDUNG(zugverbindungs_id),
	CONSTRAINT fk_zuege_fahren_zugverbindung
		FOREIGN KEY (zuege_id)
		REFERENCES ZUEGE(zuege_id)
);

CREATE TABLE WAGEN(
	wagen_id NUMBER(16) NOT NULL,
	zuege_id NUMBER(16) NOT NULL,
	namen    VARCHAR2(32),
	
	CONSTRAINT pk_wagen
		PRIMARY KEY (wagen_id),
	CONSTRAINT fk_zug_hat_wagongs
		FOREIGN KEY (zuege_id)
		REFERENCES ZUEGE(zuege_id)
);
CREATE TABLE KLASSEN(
	klassen_id  NUMBER(16) NOT NULL,
	bezeichnung VARCHAR2(32),
	
	CONSTRAINT pk_klassen
		PRIMARY KEY (klassen_id)
);
CREATE TABLE SITZE(
	sitze_id    NUMBER(16) NOT NULL,
	wagen_id    NUMBER(16) NOT NULL,
	klassen_id  NUMBER(16) NOT NULL,
	bezeichnung VARCHAR2(32) NOT NULL,
	
	CONSTRAINT pk_sitze
		PRIMARY KEY (sitze_id),
	CONSTRAINT fk_wagen_hat_sitze
		FOREIGN KEY (wagen_id)
		REFERENCES WAGEN(wagen_id),
	CONSTRAINT fk_sitz_hat_klasse
		FOREIGN KEY (klassen_id)
		REFERENCES KLASSEN(klassen_id)
);
