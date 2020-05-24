PRAGMA foreign_keys = ON;
PRAGMA encoding = "UTF-8";

DROP TABLE IF EXISTS Applied3;
DROP TABLE IF EXISTS Artista;
DROP TABLE IF EXISTS Sala_Espetaculo;
DROP TABLE IF EXISTS Datas;
DROP TABLE IF EXISTS Preco_Venda;
DROP TABLE IF EXISTS Espetaculo;
DROP TABLE IF EXISTS Comprado;
DROP TABLE IF EXISTS Preco_Compra;
DROP TABLE IF EXISTS Fornece;
DROP TABLE IF EXISTS Fornecedor;
DROP TABLE IF EXISTS Applied2;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS AppliedBarmanBar;
DROP TABLE IF EXISTS Bar;
DROP TABLE IF EXISTS Barman;
DROP TABLE IF EXISTS AppliedTransacaoCliente;
DROP TABLE IF EXISTS ApostaImprovavelGanha;
DROP TABLE IF EXISTS AppliedTransacaoCashier;
DROP TABLE IF EXISTS Cashier;
DROP TABLE IF EXISTS Transacao;
DROP TABLE IF EXISTS AppliedApostaCliente;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS AppliedApostaMesa;
DROP TABLE IF EXISTS AppliedApostaMaquina;
DROP TABLE IF EXISTS Aposta;
DROP TABLE IF EXISTS AppliedMaquinaReparacao;
DROP TABLE IF EXISTS Reparacao;
DROP TABLE IF EXISTS AppliedMaquinaTipoJogo;
DROP TABLE IF EXISTS Maquina;
DROP TABLE IF EXISTS Applied;
DROP TABLE IF EXISTS AppliedMesaTipoJogo;
DROP TABLE IF EXISTS Mesa;
DROP TABLE IF EXISTS TipoJogo;
DROP TABLE IF EXISTS Sala_Jogo;
DROP TABLE IF EXISTS Dealer;
DROP TABLE IF EXISTS Trabalho;
DROP TABLE IF EXISTS Horario;
DROP TABLE IF EXISTS Empregado;
DROP TABLE IF EXISTS Pessoa;

CREATE TABLE Pessoa(
  CC CHAR(8) PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  morada VARCHAR(100),
  idade INT CHECK(idade >= 18),
  codigoPostal CHAR(8),
  telefone CHAR(9)
);

CREATE TABLE Empregado (
  CC CHAR(8) REFERENCES Pessoa(CC),
  salario INT CHECK(salario>0),
  PRIMARY KEY(CC)
);

CREATE TABLE Horario (
  HID INT PRIMARY KEY,
  horaInicio VARCHAR(5),
  horaFim VARCHAR(5)
);

CREATE TABLE Trabalho (
  CC CHAR(8) REFERENCES Empregado(CC),
  HID INT REFERENCES Horario(HID),
  PRIMARY KEY (CC,HID)
);

CREATE TABLE Dealer (
  CC CHAR(8) REFERENCES Empregado(CC),
  PRIMARY KEY(CC)
);

CREATE TABLE Sala_Jogo (
  idSalaJogo INT PRIMARY KEY
);

CREATE TABLE Mesa (
  idMesa INT,
  idSalaJogo INT REFERENCES Sala_Jogo,
  PRIMARY KEY(idMesa, idSalaJogo)
);

CREATE TABLE TipoJogo (
  nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE AppliedMesaTipoJogo (
  idMesa INT,
  idSalaJogo INT,
  nome VARCHAR(50) REFERENCES TipoJogo(nome),
  FOREIGN KEY (idMesa, idSalaJogo) REFERENCES Mesa(idMesa, idSalaJogo),
  PRIMARY KEY (idMesa, idSalaJogo)
);

CREATE TABLE Applied (
  CC CHAR(8) REFERENCES Dealer(CC),
  idMesa INT,
  idSalaJogo INT,
  FOREIGN KEY (idMesa, idSalaJogo) REFERENCES Mesa(idMesa, idSalaJogo),
  PRIMARY KEY (CC, idMesa, idSalaJogo)
);

CREATE TABLE Maquina (
  idMaquina INT PRIMARY KEY
);

CREATE TABLE AppliedMaquinaTipoJogo (
  idMaquina INT REFERENCES Maquina(idMaquina),
  nome VARCHAR(50) REFERENCES TipoJogo(nome),
  PRIMARY KEY (idMaquina)
);

CREATE TABLE Reparacao (
  idReparacao INT PRIMARY KEY,
  DatasInicial CHAR(10),
  DatasFinal CHAR(10),
  custo REAL,
  CHECK (DatasInicial <= DatasFinal)
);

CREATE TABLE AppliedMaquinaReparacao (
  idMaquina INT REFERENCES Maquina(idMaquina),
  idReparacao INT REFERENCES Reparacao(idReparacao),
  PRIMARY KEY (idReparacao)
);

CREATE TABLE Aposta (
  idAposta INT PRIMARY KEY,
  Datas CHAR(10),
  valor REAL CHECK (valor > 0),
  resultado CHAR(1) CHECK (resultado = 'W' or resultado = 'L'),
  probabilidade REAL CHECK (probabilidade >= 0 and probabilidade <= 1)
);

CREATE TABLE AppliedApostaMaquina (
  idMaquina INT REFERENCES Maquina(idMaquina),
  idAposta INT REFERENCES Aposta(idAposta),
  PRIMARY KEY (idAposta)
);

CREATE TABLE AppliedApostaMesa (
  idMesa INT,
  idSalaJogo INT,
  idAposta INT REFERENCES Aposta,
  FOREIGN KEY (idMesa, idSalaJogo) REFERENCES Mesa(idMesa, idSalaJogo),
  PRIMARY KEY (idAposta, idMesa, idSalaJogo)
);

CREATE TABLE Cliente (
  CC CHAR(8) REFERENCES PESSOA(CC),
  PRIMARY KEY(CC)
);

CREATE TABLE AppliedApostaCliente (
  CC CHAR(8) REFERENCES Cliente(CC),
  idAposta INT REFERENCES Aposta(idAposta),
  PRIMARY KEY (idAposta)
);

CREATE TABLE ApostaImprovavelGanha (
  CC CHAR(8) REFERENCES Cliente(CC),
  idAposta INT REFERENCES Aposta(idAposta),
  PRIMARY KEY (idAposta)
);

CREATE TABLE Transacao (
  idTransacao INT PRIMARY KEY,
  valor REAL CHECK (valor>0),
  tipoTransacao VARCHAR(13),
  CHECK (tipoTransacao <>'dinheiroToken' or tipoTransacao <> 'tokenDinheiro')
);

CREATE TABLE Cashier (
  CC CHAR(8) REFERENCES Empregado(CC),
  PRIMARY KEY(CC)
);

CREATE TABLE AppliedTransacaoCashier(
  idTransacao INT REFERENCES Transacao(idTransacao),
  CC CHAR(8) REFERENCES Cashier(CC)
);

CREATE TABLE AppliedTransacaoCliente(
  idTransacao INT REFERENCES Transacao(idTransacao),
  CC CHAR(8) REFERENCES Cliente(CC)
);

CREATE TABLE Barman (
  CC CHAR(8) REFERENCES Empregado(CC),
  PRIMARY KEY(CC)
);

CREATE TABLE Bar (
  idBar INT PRIMARY KEY,
  nome VARCHAR(20) NOT NULL
);

CREATE TABLE AppliedBarmanBar (
  CC CHAR(8) REFERENCES Barman(CC),
  idBar INT REFERENCES Bar(idBar),
  PRIMARY KEY(CC)
);

CREATE TABLE Produto (
  idProduto INT PRIMARY KEY,
  nome VARCHAR(20) NOT NULL,
  disponibilidade INT CHECK (disponibilidade >=0)
);

CREATE TABLE Applied2 (
  idBar INT REFERENCES Bar(idBar),
  idProduto INT REFERENCES Produto(idProduto),
  PRIMARY KEY(idBar, idProduto)
);

CREATE TABLE Fornecedor (
  idFornecedor INT PRIMARY KEY,
  nome VARCHAR(20) NOT NULL
);

CREATE TABLE Fornece (
  idFornecedor INT REFERENCES Fornecedor(idFornecedor),
  idProduto INT REFERENCES Produto(idProduto),
  PRIMARY KEY(idFornecedor, idProduto)
);

CREATE TABLE Preco_Compra (
  idFornecedor INT REFERENCES Fornecedor(idFornecedor),
  idProduto INT REFERENCES Produto(idProduto),
  valor REAL CHECK (valor>=0),
  PRIMARY KEY(idFornecedor, idProduto)
);

CREATE TABLE Espetaculo (
  idEspetaculo INT PRIMARY KEY,
  genero VARCHAR(20) NOT NULL,
  preco REAL CHECK (preco>=0)
);

CREATE TABLE Preco_Venda (
  idEspetaculo INT REFERENCES Espetaculo(idEspetaculo),
  idFornecedor INT REFERENCES Fornecedor(idFornecedor),
  idProduto INT REFERENCES Produto(idProduto),
  valor INT CHECK (valor>=0)
);

CREATE TABLE Datas (
  idDatas INT PRIMARY KEY,
  ano INT,
  mes INT CHECK (mes>=1 and mes<=12),
  dia INT CHECK (dia>=1 and dia <=31)
);

CREATE TABLE Sala_Espetaculo (
  idEspetaculo INT REFERENCES Espetaculo(idEspetaculo),
  idDatas INT REFERENCES Datas(idDatas),
  numero INT CHECK (numero>=0),
  PRIMARY KEY(idEspetaculo, idDatas)
);

CREATE TABLE Artista (
  nome VARCHAR(20) PRIMARY KEY NOT NULL,
  orcamento REAL CHECK (orcamento>=0)
);

CREATE TABLE Applied3 (
  idEspetaculo INT REFERENCES Espetaculo(idEspetaculo),
  nomeArtista VARCHAR(20) REFERENCES Artista(nome),
  PRIMARY KEY(idEspetaculo, nomeArtista)
);
