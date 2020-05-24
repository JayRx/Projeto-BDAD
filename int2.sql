SELECT max(horaFim-horaInicio), empregado From empregado,Trabalho,Horario
  WHERE empregado.cc=trabalho.cc AND horario.hid=trabalho.hid
