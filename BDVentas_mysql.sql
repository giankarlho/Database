DROP database IF EXISTS BDVentas;
CREATE DATABASE BDVentas;
use BDVentas;

CREATE TABLE cliente(
	idcli		int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
	nomcli		varchar(30) not NULL,		-- nombre
	apecli		varchar(70) not null,			
	dnicli		varchar(70) not null,		
	sexcli		char(1) not null,		-- sexo	M o F
	naccli		char(8) not null		-- dni	
)
;
CREATE TABLE UBIGEO(
	NUMUBI		char(6) not null primary key,
	DPTUBI		varchar(50),
	PROUBI		varchar(50),
	DISUBI		varchar(50)
);

INSERT INTO cliente (nomcli,apecli,dnicli,sexcli,naccli) VALUES
('GERHARD JHON','DELGADO HUIVIN','46568659','M','1990/09/05'),
('NORMA KIMIE','HATA DE FARFAN','15419737','F','1947/12/22'),
('ISABEL','CARHUAS BENDEZU','41298816','F','2015/06/18'),
('JUAN CARLOS','REYES SANCHEZ','42504651','M','1982/03/08'),
('AMELIA','GUERRERO HUARI','07080714','F','1966/08/01');
('JHON','HUAMÁN FARFAN','46568657','M','1990/09/05'),
('HAROLD','CHUMPITAZ DE CASAS','15409737','F','1947/12/22'),
('JUANA ISABEL','CARHUAS BENDEZU','41297816','F','2010/06/25'),
('CARLOS MANUEL','REYES CRUZ','49504651','M','1982/09/08'),
('DAGNE JULIA','GUERRERO HUAMÁN','07080614','F','1966/08/10');

insert into ubigeo (NUMUBI,DPTUBI,PROUBI,DISUBI) values 
('150501','LIMA','CAÑETE','SAN VICENTE DE CAÑETE'),
('150502','LIMA','CAÑETE','ASIA'),
('150503','LIMA','CAÑETE','CALANGO'),
('150504','LIMA','CAÑETE','CERRO AZUL'),
('150505','LIMA','CAÑETE','CHILCA'),
('150506','LIMA','CAÑETE','COAYLLO'),
('150507','LIMA','CAÑETE','IMPERIAL'),
('150508','LIMA','CAÑETE','LUNAHUANA'),
('150509','LIMA','CAÑETE','MALA'),
('150510','LIMA','CAÑETE','NUEVO IMPERIAL'),
('150511','LIMA','CAÑETE','PACARAN'),
('150512','LIMA','CAÑETE','QUILMANA'),
('150513','LIMA','CAÑETE','SAN ANTONIO'),
('150514','LIMA','CAÑETE','SAN LUIS'),
('150515','LIMA','CAÑETE','SANTA CRUZ DE FLORES'),
('150516','LIMA','CAÑETE','ZUÑIGA'),
('151001','LIMA','YAUYOS','YAUYOS'),
('151002','LIMA','YAUYOS','ALIS'),
('151003','LIMA','YAUYOS','AYAUCA'),
('151004','LIMA','YAUYOS','AYAVIRI'),
('151005','LIMA','YAUYOS','AZANGARO'),
('151006','LIMA','YAUYOS','CACRA'),
('151007','LIMA','YAUYOS','CARANIA'),
('151008','LIMA','YAUYOS','CATAHUASI'),
('151009','LIMA','YAUYOS','CHOCOS'),
('151010','LIMA','YAUYOS','COCHAS'),
('151011','LIMA','YAUYOS','COLONIA'),
('151012','LIMA','YAUYOS','HONGOS'),
('151013','LIMA','YAUYOS','HUAMPARA'),
('151014','LIMA','YAUYOS','HUANCAYA'),
('151015','LIMA','YAUYOS','HUANGASCAR'),
('151016','LIMA','YAUYOS','HUANTAN'),
('151017','LIMA','YAUYOS','HUAÑEC'),
('151018','LIMA','YAUYOS','LARAOS'),
('151019','LIMA','YAUYOS','LINCHA'),
('151020','LIMA','YAUYOS','MADEAN'),
('151021','LIMA','YAUYOS','MIRAFLORES'),
('151022','LIMA','YAUYOS','OMAS'),
('151023','LIMA','YAUYOS','PUTINZA'),
('151024','LIMA','YAUYOS','QUINCHES'),
('151025','LIMA','YAUYOS','QUINOCAY'),
('151026','LIMA','YAUYOS','SAN JOAQUIN'),
('151027','LIMA','YAUYOS','SAN PEDRO DE PILAS'),
('151028','LIMA','YAUYOS','TANTA'),
('151029','LIMA','YAUYOS','TAURIPAMPA'),
('151030','LIMA','YAUYOS','TOMAS'),
('151031','LIMA','YAUYOS','TUPE'),
('151032','LIMA','YAUYOS','VIÑAC'),
('151033','LIMA','YAUYOS','VITIS')