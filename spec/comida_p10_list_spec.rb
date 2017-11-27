require "spec_helper"
require "benchmark"
include Benchmark

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

#vector de datos a ordenar
	@array_alimentos = [@huevo,@leche,@yogurt,@cerdo,@ternera,@pollo,@bacalao,@atun,@salmon,@aceite,@mantequilla,@chocolate,@azucar, @arroz, @lentejas, @papas,@tomate,@calabaza,@cebolla,@manzana,@platanos,@pera]

#Lista de la tabla
	@Tabla = Lista_Alimento.new()

	@array_alimentos.each do |x|
		@Tabla.insertar(x)
	end

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
		


  	describe "++++++++++++Visualizar datos++++++++++++++++++" do
  		it "Visualización de datos" do
	#comento la visualización para que las pruebas sean más faciles de leer
  			#puts @Tabla.to_s()
  		end
  	end

  	it "Ordenación de la lista con tabla de datos por medio del sort" do

  		@Tabla_ordenada = @Tabla.sort()
  		expect(@Tabla.sort).to eq(@Tabla_ordenada)
 		expect(@Tabla.sort).to eq([@tomate,@calabaza,@cebolla,@manzana,@pera,@leche,@yogurt,@papas,@bacalao,@platanos,@ternera,@pollo,@cerdo,@salmon,@atun,@huevo,@lentejas,@arroz,@azucar,@chocolate,@mantequilla,@aceite])
  	end

 	it "Ordenación de lista de datos por medio del each" do

 # 		expect(@Tabla.ordenar_each_list()).to eq(@Tabla.sort())
 		
  	end

  	it "Ordenación de matriz y vector de datos por medio del for" do
  		#expect(@Tabla.ordenar_for_list()).to eq([@tomate,@calabaza,@cebolla,@manzana,@pera,@leche,@yogurt,@papas,@bacalao,@platanos,@ternera,@pollo,@cerdo,@salmon,@atun,@huevo,@lentejas,@arroz,@azucar,@chocolate,@mantequilla,@aceite])
  	end

=begin

  	it "Uso del benchmark" do

		Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  			tf = x.report("for:")   { @array_alimentos.ordenar_for_vec }
			tt = x.report("sort:") { @array_alimentos.sort }
			tu = x.report("each:")  { @array_alimentos.quicksort(@array_alimentos.dup()) }
			[tf+tt+tu, (tf+tt+tu)/3]
		end
  	end
  end
=end
	end
end    
