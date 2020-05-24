insert into Aposta values (75,'2020-04-20',5,'L',0.6);
insert into AppliedApostaCliente values(76543290,75);
insert into Aposta values (76,'2020-04-20',50,'L',0.6);
insert into AppliedApostaCliente values(76543290,76);
insert into Aposta values (77,'2020-04-20',500,'L',0.6);
insert into AppliedApostaCliente values(76543290,77);

 SELECT Batoteiro.CC, nome from Batoteiro
inner join Pessoa on Pessoa.CC=Batoteiro.CC; 