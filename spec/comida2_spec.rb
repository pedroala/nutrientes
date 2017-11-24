require "spec_helper"


RSpec.describe Comida do

  before :all do

#alimentos para la matriz

	@huevo = 	Alimentos_Derivados.new("huevo",14.1,0.0,19.5,nil,"Huevos, lacteos y helados")
 	@leche = 	Alimentos_Derivados.new("leche",3.3,4.8,3.2,nil,"Huevos, lacteos y helados")
	@yogurt = 	Alimentos_Derivados.new("yogurt",3.8,4.9,3.8,nil,"Huevos, lacteos y helados")

	@cerdo = 	Alimentos_Derivados.new("cerdo",21.5,0.0,6.3,nil,"Carnes y derivados")
	@ternera = 	Alimentos_Derivados.new("ternera",21.1,0.0,3.1,nil,"Carnes y derivados")
	@pollo = 	Alimentos_Derivados.new("pollo",20.6,0.0,5.6,nil,"Carnes y derivados")

	@bacalao = 	Alimentos_Derivados.new("bacalao",17.7,0.0,0.4,nil,"Pescados y mariscos")
	@atun = 	Alimentos_Derivados.new("atun",21.5,0.0,15.5,nil,"Pescados y mariscos")
	@salmon = 	Alimentos_Derivados.new("salmon",19.9,0.0,13.6,nil,"Pescados y mariscos")

	@aceite = 	Alimentos_Derivados.new("aceite",0.0,0.2,99.6,nil,"grasos")
	@mantequilla = Alimentos_Derivados.new("mantequilla",0.7,0.0,83.2,nil,"grasos")
	@chocolate =Alimentos_Derivados.new("chocolate",5.3,47.0,30.0,nil,"grasos")

	@azucar =	Alimentos_Derivados.new("azucar",0.0,99.8,0.0,nil,"carbohidratos")
	@arroz = Alimentos_Derivados.new("arroz",6.8,77.7,0.6,nil,"carbohidratos")
	@lentejas =	Alimentos_Derivados.new("lentejas",23.5,52.0,1.4,nil,"carbohidratos")
	@papas = 	Alimentos_Derivados.new("papas",2.0,15.4,0.1,nil,"carbohidratos")

	@tomate = 	Alimentos_Derivados.new("tomate", 1.0,3.5,0.2,nil,"verdura")
	@cebolla = 	Alimentos_Derivados.new("cebolla",1.3,5.8,0.3,nil,"verdura")
	@calabaza = Alimentos_Derivados.new("calabaza",1.1,4.8,0.1,nil,"verdura")

	@manzana = 	Alimentos_Derivados.new("manzana",0.3,12.4,0.4,nil,"fruta")
	@platanos = Alimentos_Derivados.new("platanos",1.2,21.4,0.2,nil,"fruta")
	@pera = Alimentos_Derivados.new("pera",0.5,12.7,0.3,nil,"fruta")

#vectores fila de la matriz

	@vector_lacteos = [@huevo,@leche,@yogurt]
	@vector_carnes = [@cerdo,@ternera,@pollo]
	@vector_pescados = [@bacalao,@atun,@salmon]
	@vector_grasos = [@aceite,@mantequilla,@chocolate]
	@vector_carbohidratos = [@azucar, @arroz, @lentejas, @papas]
	@vector_verduras = [@tomate,@calabaza,@cebolla]
	@vector_frutas = [@manzana,@platanos,@pera]

#vector de vectores (matriz)
	@matriz = [@vector_lacteos,@vector_carnes,@vector_pescados,@vector_grasos,@vector_carbohidratos,@vector_verduras,@vector_frutas]


  end

  context "Practica 10" do

  	it "Instanciar alimentos derivados que deberemos colocar en la tabla" do

  		expect(@huevo.is_a?Alimento).to eq(true)
  		expect(@huevo.is_a?Alimentos_Derivados).to eq(true)
  		expect(@huevo.class).to eq(Alimentos_Derivados)

  		expect(@leche.is_a?Alimento).to eq(true)
  		expect(@leche.is_a?Alimentos_Derivados).to eq(true)
  		expect(@leche.class).to eq(Alimentos_Derivados)
  		

  	end

  	it "Ordenación de la matriz de datos por medio del sort" do

  		expect(@matriz.sort).to eq(@huevo)
  	end
  end
end

=begin

    "tomate",
       "calabaza",
       "cebolla"
       "manzana"
       "platanos", 
       "pera",
       "bacalao"
       "atun"
       "salmon"
       + [#<Alimentos_Derivados:0x000000020f9270 @nombre="cerdo", @proteinas=21.5, @glucidos=0.0, @lipidos=6.3, @g=nil, @valor_energetico=142.7, @tipo="Carnes y derivados">,
       +  #<Alimentos_Derivados:0x000000020f91f8 @nombre="ternera", @proteinas=21.1, @glucidos=0.0, @lipidos=3.1, @g=nil, @valor_energetico=112.30000000000001, @tipo="Carnes y derivados">,
       +  #<Alimentos_Derivados:0x000000020f9158 @nombre="pollo", @proteinas=20.6, @glucidos=0.0, @lipidos=5.6, @g=nil, @valor_energetico=132.8, @tipo="Carnes y derivados">],
       + [#<Alimentos_Derivados:0x000000020f9428 @nombre="huevo", @proteinas=14.1, @glucidos=0.0, @lipidos=19.5, @g=nil, @valor_energetico=231.9, @tipo="Huevos, lacteos y helados">,
       +  #<Alimentos_Derivados:0x000000020f93b0 @nombre="leche", @proteinas=3.3, @glucidos=4.8, @lipidos=3.2, @g=nil, @valor_energetico=61.2, @tipo="Huevos, lacteos y helados">,
       +  #<Alimentos_Derivados:0x000000020f9310 @nombre="yogurt", @proteinas=3.8, @glucidos=4.9, @lipidos=3.8, @g=nil, @valor_energetico=69.0, @tipo="Huevos, lacteos y helados">],
       + [#<Alimentos_Derivados:0x000000020f8d98 @nombre="azucar", @proteinas=0.0, @glucidos=99.8, @lipidos=0.0, @g=nil, @valor_energetico=399.2, @tipo="carbohidratos">,
       +  #<Alimentos_Derivados:0x000000020f8cf8 @nombre="arroz", @proteinas=6.8, @glucidos=77.7, @lipidos=0.6, @g=nil, @valor_energetico=343.4, @tipo="carbohidratos">,
       +  #<Alimentos_Derivados:0x000000020f8c30 @nombre="lentejas", @proteinas=23.5, @glucidos=52.0, @lipidos=1.4, @g=nil, @valor_energetico=314.6, @tipo="carbohidratos">,
       +  #<Alimentos_Derivados:0x000000020f8bb8 @nombre="papas", @proteinas=2.0, @glucidos=15.4, @lipidos=0.1, @g=nil, @valor_energetico=70.5, @tipo="carbohidratos">],
       + [#<Alimentos_Derivados:0x000000020f8f28 @nombre="aceite", @proteinas=0.0, @glucidos=0.2, @lipidos=99.6, @g=nil, @valor_energetico=897.1999999999999, @tipo="grasos">,
       +  #<Alimentos_Derivados:0x000000020f8eb0 @nombre="mantequilla", @proteinas=0.7, @glucidos=0.0, @lipidos=83.2, @g=nil, @valor_energetico=751.6, @tipo="grasos">,
       +  #<Alimentos_Derivados:0x000000020f8e10 @nombre="chocolate", @proteinas=5.3, @glucidos=47.0, @lipidos=30.0, @g=nil, @valor_energetico=479.2, @tipo="grasos">]]
       
=end