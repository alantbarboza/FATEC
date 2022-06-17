use labbd;


CREATE TABLE Veiculo
(
 PL_Placa varchar(8)  NOT NULL,
 MA_Marca varchar(25)  NOT NULL,
 MO_Modelo varchar(25)  NOT NULL,
 AN_AnoFabricacao date NOT NULL,
 constraint v1 primary key (PL_Placa)
)

CREATE TABLE Motorista
(
 CO_CodMotorista int default 10  NULL,
 NO_Nome         varchar(25) NOT NULL,
 NU_NumConta     int NULL,
 constraint u1 UNIQUE (NU_NumConta),
 constraint m1 primary key (CO_CodMotorista)
)

CREATE TABLE utiliza
(
 PL_Placa varchar(8) NOT NULL,
 CO_CodMotorista int NOT NULL,
 data_uso date NOT NULL,
 constraint v1 FOREIGN KEY (PL_Placa) REFERENCES Veiculo,
 constraint v1 FOREIGN KEY (CO_CodMotorista) REFERENCES Motorista
)
