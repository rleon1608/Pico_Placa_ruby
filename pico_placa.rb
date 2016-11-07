require 'date'
require 'time'
#Programa realizado por:Ronald Leon
# Simulador de Pico y Placa 
# Datos de entrada: placa, Fecha y Hora
# Salida: indicar si el carro puede estar en circulacion o no
# define la clase placa
class Placa
 
  # método inicializar clase
  def initialize(arg_placa)  
    # atributos   
    @placa = arg_placa 
    @ult_digito = arg_placa[arg_placa.length-1..arg_placa.length]
  end  
  #Metodo para validar que el ultimo digito de la placa sea numerico
  def valida_nro
   vl_num = '0'..'9'
   unless vl_num.include?(@ult_digito) 
      raise 'Error el ultimo caracter de la placa debe ser numerico'
    end
  end
  #Metodo para validar la longitud de la placa
  def valida_long(arg_placa)
    vl_lon = 7..8
    unless vl_lon.include?(arg_placa.length) 
      raise 'Error la placa debe conterner 7 o 8 digitos'
    end
  end
end  

begin
  #Se solicita el numero de Placa
  print "Introduzca el Nro. de Placa: "
  placa = gets.chomp
  #Se crea el Objeto Placa
  d = Placa.new(placa)
  # Se realiza las validaciones pertinentes sobre el Objeto Placa
  d.valida_long(placa)
  d.valida_nro
  #Se solicita la Fecha
  print "Introduzca la Fecha: "
  f = gets.chomp
  fe =DateTime.parse(f).to_date
  di =fe.strftime("%A")
  puts "Dia de la Semana: #{di}"
  #Se solicita la hora
  print "Introduzca la hora: "
  h = gets.chomp
  ho = Time.parse(h).to_time
  ho = ho.strftime("%H:%M")
  puts "la hora es: #{ho}"
  #se le dan vaor a los constantes para el control de la hora pico y placa
  #Hora mañana
  tm1 = Time.parse('07:00').to_time.strftime("%H:%M")
  tm2 = Time.parse('09:30').to_time.strftime("%H:%M")
  #Hora tarde
  tt1 = Time.parse('16:00').to_time.strftime("%H:%M")
  tt2 = Time.parse('19:30').to_time.strftime("%H:%M")
  swh = 0
  if ho.between?(tm1,tm2) || ho.between?(tt1,tt2)
   puts "la hora  esta en e rango de Pico y Placa"
   swh = 1
  end
  p =  placa[placa.length-1..placa.length]
  if ('1'..'2')===p  && swh == 1 && di == 'Monday'
     puts "El carro de la placa #{placa}, no puede circular, le corresponde Pico y Placa"
  elsif ('3'..'4')===p  && swh == 1 && di == 'Tuesday'
     puts "El carro de la placa #{placa}, no puede circular, le corresponde Pico y Placa"
  elsif ('5'..'6')===p  && swh == 1 && di == 'Wednesday'
     puts "El carro de la placa #{placa}, no puede circular, le corresponde Pico y Placa"
  elsif ('7'..'8')===p  && swh == 1 && di == 'Thursday'
     puts "El carro de la placa #{placa}, no puede circular, le corresponde Pico y Placa"
  elsif ('9'..'0')===p  && swh == 1 && di == 'Friday'
     puts "El carro de la placa #{placa}, no puede circular, le corresponde Pico y Placa"
  else 
     puts "El carro e la placa #{placa}, puede circular libremente"
  end 
end
