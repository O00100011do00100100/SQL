CREATE TABLE ZOOS
(
	zoo_id NUMBER  (16) NOT NULL,
	name   VARCHAR2(32),
	
	CONSTRAINT pk_zoos
		PRIMARY KEY (zoo_id)
);

CREATE TABLE ADDRESSE
(
	address_id NUMBER  (16) NOT NULL,
	zoo_id     NUMBER  (16) NOT NULL,
	plz        NUMBER  (5),
	ort        VARCHAR2(32),
	
	CONSTRAINT pk_addresse
		PRIMARY KEY (address_id),
		
	CONSTRAINT fk_addresse
		FOREIGN KEY    (zoo_id)
		REFERENCES ZOOS(zoo_id)
);

CREATE TABLE STRASSE
(
	strassen_id NUMBER  (16) NOT NULL,
	address_id  NUMBER  (16) NOT NULL,
	strasse     VARCHAR2(32),
	hausnr      NUMBER  (8),
	hauszusatz  VARCHAR2(5),
	
	CONSTRAINT pk_strasse
		PRIMARY KEY (strassen_id),
		
	CONSTRAINT fk_strasse
		FOREIGN KEY        (address_id)
		REFERENCES ADDRESSE(address_id)
);

CREATE TABLE TIERARTEN
(
	tierart_id NUMBER  (16) NOT NULL,
	zoo_id     NUMBER  (16) NOT NULL,
	name       VARCHAR2(32),
	
	CONSTRAINT pk_tierarten
		PRIMARY KEY(tierart_id),
	
	CONSTRAINT fk_tierarten
		FOREIGN KEY    (zoo_id)
		REFERENCES ZOOS(zoo_id)
);

CREATE TABLE PFLEGER
(
	pfleger_id    NUMBER  (16) NOT NULL,
	name          VARCHAR2(32),
	nach_name     VARCHAR2(32),
	geburts_datum DATE,
	gehalt        FLOAT,
	
	CONSTRAINT pk_pfleger
		PRIMARY KEY (pfleger_id)
);

CREATE TABLE TIERE_HABEN_PFLEGER
(
	tierart_id    NUMBER(16) NOT NULL,
	pfleger_id    NUMBER(16) NOT NULL,
	
	CONSTRAINT fk_tiere_haben_pfleger
		FOREIGN KEY         (tierart_id)
		REFERENCES TIERARTEN(tierart_id),
	
	CONSTRAINT fk_pfleger_hat_tiere
		FOREIGN KEY       (pfleger_id)
		REFERENCES PFLEGER(pfleger_id)
);

CREATE TABLE RAUM
(
	raum_id    NUMBER(16) NOT NULL,
	tierart_id NUMBER(16) NOT NULL,
	raumnr     NUMBER(16) NOT NULL,
	fleasche   FLOAT,
	
	CONSTRAINT pk_raum
		PRIMARY KEY (raum_id),
		
	CONSTRAINT fk_raum
		FOREIGN KEY         (tierart_id)
		REFERENCES TIERARTEN(tierart_id)
);

CREATE TABLE TIER
(
	tier_id    NUMBER  (16) NOT NULL,
	geschlecht VARCHAR2(32),
    age        INTEGER,
	
	CONSTRAINT pk_tier
		PRIMARY KEY (tier_id)
);

CREATE TABLE RAUM_HAT_TIEREXEMPLAR
(
	raum_id    NUMBER(16) NOT NULL,
	tier_id    NUMBER(16) NOT NULL,
	
	CONSTRAINT fk_raum_hat_tierexemplar
		FOREIGN KEY    (raum_id)
		REFERENCES RAUM(raum_id),
		
	CONSTRAINT fk_tierexemplare_sind_in_raum
		FOREIGN KEY    (tier_id)
		REFERENCES TIER(tier_id)	
);

CREATE TABLE FUTTERMEUSCHUNG
(
	futtermeuschung_id NUMBER (16) NOT NULL,
	bezeichnung        VARCHAR(16),
	
	CONSTRAINT pk_futtermeuschung
		PRIMARY KEY (futtermeuschung_id)
);

CREATE TABLE TIER_HAT_FUTTERMEUSCHUNG
(
	tier_id            NUMBER(16) NOT NULL,
	futtermeuschung_id NUMBER(16) NOT NULL,
	
	CONSTRAINT fk_tier_hat_futterm
		FOREIGN KEY    (tier_id)
		REFERENCES TIER(tier_id),
		
	CONSTRAINT fk_futtermuschung_wir_von_tier_gegessen
		FOREIGN KEY               (futtermeuschung_id)
		REFERENCES FUTTERMEUSCHUNG(futtermeuschung_id)
);

CREATE TABLE FUTTERMITTEL
(
	futtermittel_id NUMBER  (16) NOT NULL,
	bezeichnung     VARCHAR2(32),
	
	CONSTRAINT pk_futtermittel
		PRIMARY KEY (futtermittel_id)
);

CREATE TABLE FUTTERMEUSCHUNG_HAT_FUTTERMITTEL
(
	futtermeuschung_id NUMBER(16) NOT NULL,
	futtermittel_id    NUMBER(16) NOT NULL,
	
	CONSTRAINT fk_futtermeuschung_hat_futtermittel
		FOREIGN KEY               (futtermeuschung_id)
		REFERENCES FUTTERMEUSCHUNG(futtermeuschung_id),
		
	CONSTRAINT fk_futtermittel_ist_in_futtermeuschung
		FOREIGN KEY            (futtermittel_id)
		REFERENCES FUTTERMITTEL(futtermittel_id)
);

CREATE TABLE LIFERANTEN
(
	liferanten_id NUMBER  (16) NOT NULL,
	name          VARCHAR2(32),
	
	CONSTRAINT pk_liferanten
		PRIMARY KEY (liferanten_id)
);

CREATE TABLE FUTTERMITTEL_HAT_LIFERANTEN
(
	futtermittel_id NUMBER(16) NOT NULL,
	liferanten_id   NUMBER(16) NOT NULL,

	CONSTRAINT fk_futtermittel_hat_liferanten
		FOREIGN KEY            (futtermittel_id)
		REFERENCES FUTTERMITTEL(futtermittel_id),
		
	CONSTRAINT fk_liferanten_bringt_futtermittel
		FOREIGN KEY          (liferanten_id)
		REFERENCES LIFERANTEN(liferanten_id)
);

CREATE TABLE LIFERANTEN_ADDRESSE
(
	liferanten_address_id NUMBER  (16) NOT NULL,
	liferanten_id         NUMBER  (16) NOT NULL,
	plz 				  NUMBER  (5),
	ort                   VARCHAR2(32),
	strasse               VARCHAR2(32),
	hausnr                INTEGER,
	
	CONSTRAINT pk_liferanten_address
		PRIMARY KEY (liferanten_address_id),
		
	CONSTRAINT fk_liferanten_address
		FOREIGN KEY          (liferanten_id)
		REFERENCES LIFERANTEN(liferanten_id)
);

CREATE TABLE LAGER(
	lager_id    NUMBER  (16) NOT NULL,
	bezeichnung VARCHAR2(32),
	
	CONSTRAINT pk_lager
		PRIMARY KEY (lager_id)
);

CREATE TABLE LAGER_HAT_FUTTERMITTEL
(
	lager_id        NUMBER(16) NOT NULL,
	futtermittel_id NUMBER(16) NOT NULL,
	menge           float,
	
	CONSTRAINT fk_lager_hat_futtermittel
		FOREIGN KEY     (lager_id)
		REFERENCES LAGER(lager_id),
		
	CONSTRAINT fk_futtermittel_ist_in_lager
		FOREIGN KEY            (futtermittel_id)
		REFERENCES FUTTERMITTEL(futtermittel_id)
);


INSERT INTO PFLEGER(PFLEGER_ID,NAME,NACH_NAME,GEBURTS_DATUM,GEHALT)
VALUES (1,'Admin','Master',TO_DATE('30-04-1999', 'DD-MM-YYYY'),3500.00);
