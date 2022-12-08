CREATE TABLE STATION(
	station_id NUMBER(50) NOT NULL,
	name VARCHAR2(50),
	
	CONSTRAINT station_pk 
		PRIMARY KEY (station_id)
);

CREATE TABLE ZUGVERBINDUNG(
	zugverbindungs_id NUMBER(50) NOT NULL,
	abfahratszeit TIME,
	ankunftszeit TIME,
	
	CONSTRAINT zugverbindungs_pk 
		PRIMARY KEY (zugverbindungs_id)
);

CREATE TABLE ZUEGE(
	zug_id NUMBER(50) NOT NULL,
	namen VARCHAR2(50),
	
	CONSTRAINT zug_pk 
		PRIMARY KEY (zug_id),
		
	CONSTRAINT fk_zuege 
		FOREIGN KEY (zugverbindungs_id)
		REFERENCES ZUGVERBINDUNG(zugverbindungs_id)
);

CREATE TABLE WAGONGS(
	wagong_id NUMBER(50) NOT NULL,
	bezeichnung VARCHAR2(50),
	
	CONSTRAINT wagong_pk
		PRIMARY KEY (wagong_id),
		
	CONSTRAINT fk_wagong
		FOREIGN KEY (zug_id)
		REFERENCES ZUEGE(zug_id)
);

CREATE TABLE WAGONG_HAT_KLASSEN(
	
	CONSTRAINT fk_wagong_hat_klassen
		FOREIGN KEY (wagong_id)
		REFERENCES WAGONGS(wagong_id)
		
	CONSTRAINT fk_klassen_in_wagongs
		FOREIGN KEY (klassen_id)
		REFERENCES KLASSEN(klassen_id)
);

CREATE TABLE KLASSEN(
	klassen_id NUMBER(50) NOT NULL
	bezeichnung VARCHAR2(50),
	
	CONSTRAINT klassen_pk
		PRIMARY KEY (klassen_id)
);

INSERT INTO KLASSEN(bezeichnung)
VALUES('FIRST KLASSE');

CREATE OR REPLACE VIEW view_eins AS SELECT * FROM KLASSE;

https://mail.tutanota.com/mail/NGQZbkh-0Z-9
78047aaa6963ca9ef487da471c2f98a78680cc1c01b68bfc6485e804f3d354be