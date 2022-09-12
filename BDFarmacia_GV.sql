

DROP database IF EXISTS BDFarmacia;
CREATE DATABASE BDFarmacia;
go
use BDFarmacia;
go

-- drop table paciente
-- select * from paciente
DROP TABLE IF EXISTS PACIENTE;
CREATE TABLE PACIENTE(
	IDPAC		int identity(1,1) PRIMARY KEY NOT NULL ,
	NOMPAC		varchar(30) not NULL ,		-- nombre
	APEPAC		varchar(70) not null,		-- apellido
	SEXPAC		char(1) not null,		-- sexo	M o F
	FNAPAC		date,					-- fecha de nacimiento
	DNIPAC		char(8) not null,		-- dni	
	TELPAC		varchar(30)  ,
	EMAPAC		varchar(30) NULL ,			-- email
	NUMUBI		char(6),				-- ubigeo direccion
	DIRPAC		varchar(50),  			-- direccion
	GRSPAC		varchar(5),				-- grupo sanguineo
	HICPAC		char(11),				-- historia clínica del sistema: fecha de ingreso 'ddmmaaaa' + correlativo (3)			
	ESTPAC		char(1)					-- Activo o no					
);
GO
DROP TABLE IF EXISTS USUARIO;
CREATE TABLE USUARIO (
	IDUSU			int identity(1,1) primary key not null,
	NOMUSU			varchar(50),
	USUUSU			char(5),
	PWDUSU			varchar(50),
	DNIUSU			char(8),	
	TELUSU			VARCHAR(30),
	NACUSU			date,
	CARUSU			varchar(30) ,
	UBIUSU			CHAR(6),
	LEVUSU			CHAR(1)		-- niveles de acceso: 1 ADMIN , 2 OPERARIO
)
;
GO

--drop table PROVEEDOR 
--select * from PROVEEDOR
DROP TABLE IF EXISTS PROVEEDOR;
CREATE TABLE PROVEEDOR(
	IDPRO		int identity(1,1) primary key not null,
	NOMPRO		varchar(80) not null,
	RUCPRO		char(11) not null,
	DIRPRO		varchar(100),	
	TIPPRO		varchar(18),		-- laboratorio o distribuidor
	TELPRO		varchar(50),			-- teléfono proveedor
	COMPRO		varchar(80),		-- nombre comercial
	ABRPRO		varchar(8),		-- abreviatura del proveedor
	NUMUBI		char(6),
	ESTPRO		char(1) default 'A'
);
GO

-- SELECT * from MEDICINA
-- drop table medicina
DROP TABLE IF EXISTS MEDICINA;
CREATE TABLE MEDICINA
(
	IDMED		bigint identity(1,1) primary key NOT NULL ,
	GENMED		varchar(100),		-- nombre genérico del medicamento
	COMMED		varchar(80),		-- nombre comercial del medicamento
	COSMED		decimal(10,2),		-- costo
	PREMED		decimal(10,2),		-- precio 
	PRSMED		varchar(40),		-- presentación: frasco, tableta, tarro, etc
	CANMED		int,			-- cantidad
	OBSMED		varchar(80),		-- observacion		
	LUGMED		varchar(4),			-- ubicación del medicamento dentro de farmacia
	FCHMED		date,				-- fecha de vencimiento 
	LOTMED		varchar(8),
	ESTMED		char(1) default 'A',	-- estado: Activo,Baja
	IDPRO		int						-- proveedor
);
GO
-- drop table DOC_VENTA
DROP TABLE IF EXISTS DOC_VENTA;
CREATE TABLE DOC_VENTA
(
	IDDOC		bigint identity(1,1) primary key not null,		-- codigo correlativo de la venta
	NUMDOC		varchar(14) NOT NULL ,							-- 0002-123456
	TIPDOC		char(1),										-- si es boleta , factura o ticket
	FCHDOC		datetime default getdate(),						-- fecha de la venta
	MONDOC		decimal(10,2),									-- monto total de la venta
	OBSDOC		varchar(50),									-- observación
	IDPAC		bigint,											-- código del paciente
	ESTDOC		char(1) default 'A'					
);
GO
-- drop table DETVENTA 
DROP TABLE IF EXISTS DETVENTA;
CREATE TABLE DETVENTA
(
	IDMED		bigint  NOT NULL ,				-- código de la medicina
	IDDOC		bigint  NOT NULL ,				-- código del doc_venta
	PREVTA		decimal(10,2),					-- precio unit. de la medicina vendida
	CANVTA		int,							-- cantidad de medicina vendida
	STOVTA		decimal(10,2),					-- subtotal de medicina vendida
	CONSTRAINT  XPKDETVENTA PRIMARY KEY (IDMED  ASC,IDDOC  ASC)
);
GO

-- drop table DOC_COMPRA
CREATE TABLE DOC_COMPRA
(
	IDDOC	bigint identity(1,1) primary key,	-- codigo correlativo de la compra
	NUMDOC		varchar(14) NOT NULL ,			-- nro de la boleta o factura
	TIPDOC		varchar(12),					-- boleta , factura , GuiaRemision, 
	FCHDOC  datetime default getdate(),			-- fecha de ingreso
	MONDOC	decimal(12,2),					-- monto total de la compra
	OBSDOC		varchar(50),					-- observación	
	ESTDOC		char(1),						-- eliminado, compra o donacion: E,A,D
	IDPRO		int								-- código del proveedor
)

go

-- drop table detcompra
CREATE TABLE DETCOMPRA
(
	IDMED		bigint  NOT NULL ,
	IDDOC		bigint  NOT NULL ,
	PREMED		decimal(8,2),		-- precio de compra del medicamento
	CANCOM		int,				-- cantidad de compra de la medicina
	STOCOM		decimal(12,2),		-- sub total del medicamento	
	CONSTRAINT  XPKDETCOMPRA PRIMARY KEY (IDMED  ASC,IDDOC  ASC)
)
go
-- drop table ubigeo
DROP TABLE IF EXISTS UBIGEO;
CREATE TABLE UBIGEO(
	NUMUBI		char(6) not null primary key,
	DPTUBI		varchar(50),
	PROUBI		varchar(50),
	DISUBI		varchar(50)
);
GO
-- drop table serie
DROP TABLE IF EXISTS SERIE;
CREATE TABLE SERIE
(	
	TIPSER		int primary key,		--	1 si es boleta, 2 si es factura, 3 si es ticket, 4 si es orden interna , 5: Donacion,6: Laboratorio
	FACSER		varchar(14)				--	nro de comprobante: FAR2018-000001 , LAB2018-000005	 
);
GO