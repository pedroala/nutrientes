require "spec_helper"

RSpec.describe Comida do

  before :all do
    @huevo = 	Alimento.new("huevo",14.1,0.0,19.5,nil)
	@leche = 	Alimento.new("leche",3.3,4.8,3.2,[[]])
	@yogurt = 	Alimento.new("yogurt",3.8,4.9,3.8,[[6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4],[4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9, 5.9, 5.8, 5.8, 5.5, 5.5, 5.6, 5.9, 5.9]])
	@cerdo = 	Alimento.new("cerdo",21.5,0.0,6.3,nil)
	@ternera = 	Alimento.new("ternera",21.1,0.0,3.1,nil)
	@pollo = 	Alimento.new("pollo",20.6,0.0,5.6,nil)
	@bacalao = 	Alimento.new("bacalao",17.7,0.0,0.4,nil)
	@atun = 	Alimento.new("atun",21.5,0.0,15.5,nil)
	@salmon = 	Alimento.new("salmon",19.9,0.0,13.6,nil)
	@aceite = 	Alimento.new("aceite",0.0,0.2,99.6,nil)
	@chocolate =Alimento.new("chocolate",5.3,47.0,30.0,[[6.5, 6.5, 6.7, 6.5, 6.5, 6.8, 6.7, 6.2, 6.5, 7.2, 6.9, 7.0, 6.3, 6.2, 6.1, 5.9, 5.8, 6.1, 6.7, 6.7, 6.6, 6.7, 6.9, 7.2, 7.1],[4.6, 4.6, 4.7, 4.7, 4.8, 4.7, 4.8, 4.8, 4.6, 4.4, 4.7, 4.7, 4.8, 4.7, 5.2, 5.9, 5.9, 5.7, 5.4, 5.3, 5.1, 4.8, 4.8, 4.9, 5.9]])
	@azucar =	Alimento.new("azucar",0.0,99.8,0.0,[[4.9, 5.3, 5.9, 6.7 ,7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1],[6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]])
	@lentejas =	Alimento.new("lentejas",23.5,52.0,1.4,nil)
	@papas = 	Alimento.new("papas",2.0,15.4,0.1,nil)
	@tomate = 	Alimento.new("tomate", 1.0,3.5,0.2,nil)
	@cebolla = 	Alimento.new("cebolla",1.3,5.8,0.3,nil)
	@manzana = 	Alimento.new("manzana",0.3,12.4,0.4,[[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9],[4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]])
	@platanos = Alimento.new("platanos",1.2,21.4,0.2,nil)

	@A = Node.new(@huevo)
	@B = Node.new(@leche)
	@C = Node.new(@lentejas)
	@D = Node.new(@tomate)
	@E = Node.new(@manzana)
	@List = Lista_Alimento.new()
	@List_aibc = Lista_Alimento.new()

	@mantequilla = Alimentos_Dervivados.new("mantequilla",0.7,0.0,83.2,"grasos",nil)
	@arroz = Alimentos_Dervivados.new("arroz",6.8,77.7,0.6,"carbohidratos",nil)
	@calabaza = Alimentos_Dervivados.new("calabaza",1.1,4.8,0.1,"verdura",nil)
	@pera = Alimentos_Dervivados.new("pera",0.5,12.7,0.3,"fruta",nil)

	@F = Node.new(@manzana)
	@G = Node.new(@yogurt)
	@H = Node.new(@chocolate)
	@I = Node.new(@azucar)


  end
	context "Pruebas clase Alimento" do
	  it "Instanciar alimentos para comprobar constructor y variables de instancias para proteinas, glúcidos y lípidos" do
		expect(@yogurt.class).to eq(Alimento)
		#Más el before que instancia y eso hace que compruebe
	  end

	  it "Métodos getters" do
		expect(@huevo.proteinas).to eq(14.1)
	  end

	  it "Salida formateada" do
		expect(@huevo.to_s).to eq("huevo: tiene 14.1 gramos de proteinas, 0.0 gramos de glúcidos y 19.5 gramos de lípidos. Su valor energético es: 231.9 Kcal")
	  end
	  
	  it "Calcular valor energético del alimento" do
		expect(@huevo.valor_energetico).to eq(231.9)
		expect(@pera.valor_energetico).to eq(55.5)
		expect(@chocolate.valor_energetico).to eq(479.2)


	  end
	end

	context "Pruebas clase Lista_Alimento" do
	  it "Crear Nodo" do
	  	expect(@A.class).to eq(Node)
	  	#Más la instanciación en el before
	  end

	  it "Crear lista con head y cola" do

	  	expect(@List.class).to eq(Lista_Alimento)
	  end

	  it "Comprobar que los atributos de la lista pueden obtenerse - Métodos getters" do

	  	expect(@List.head.next.value).to eq(nil)
	  	expect(@List.head.prev).to eq(nil)
	  	expect(@List.head.value).to eq(nil)

	  end

	  it "Insertar un elemento en la lista - por defecto inserta por la cola" do
	  	@List.insertar(@A)
	  	expect(@List.head.next.value).to eq(@huevo) 
	  	expect(@List.head.prev).to eq(nil)
	  	expect(@List.head.value).to eq(nil)
	  	expect(@List.cola.prev.value).to eq(@huevo) #Lista = HEAD->Huevo

	  	@List.insertar(@B)
	  	expect(@List.head.next.value).to eq(@huevo)
	  	expect(@List.head.prev).to eq(nil)
	  	expect(@List.head.value).to eq(nil)
	  	expect(@List.cola.prev.value).to eq(@leche) #Lista = HEAD->Huevo->Leche

	    @List.insertar(@C)
	  	expect(@List.head.next.value).to eq(@huevo)
	  	expect(@List.head.prev).to eq(nil)
	  	expect(@List.head.value).to eq(nil)
	  	expect(@List.cola.prev.value).to eq(@lentejas) #Lista = HEAD->Huevo->Leche->Lentejas

	  	@List.insertar(@D)
	  	expect(@List.head.next.value).to eq(@huevo)
	  	expect(@List.head.prev).to eq(nil)
	  	expect(@List.head.value).to eq(nil)
	  	expect(@List.cola.prev.value).to eq(@tomate) #Lista = HEAD->Huevo->Leche->Lentejas->Tomate->Cola

	  end

	  it "Insertar por la cabeza de la lista" do

	  	expect(@List.head.next.value).to eq(@huevo)
	  	@List.insert_head(@E)
	  	expect(@List.head.next.value).to eq(@manzana) #Lista = HEAD->Manzana->Huevo->Leche->Lentejas->Tomate->Cola
	  end

	  it "Eliminar nodo por la cabeza" do
	  	expect(@List.head.next.value).to eq(@manzana)
	  	@List.eliminar_head()

	  	expect(@List.head.next.value).to eq(@huevo) #Lista = HEAD->Huevo->Leche->Lentejas->Tomate->Cola
	  	@List.eliminar_head()
	  	expect(@List.head.next.value).to eq(@leche) #Lista = HEAD->Leche->Lentejas->Tomate->Cola
	  end

	  it "Eliminar nodo por la cola" do
	  	expect(@List.cola.prev.value).to eq(@tomate)
	  	@List.eliminar_cola()
	  	expect(@List.cola.prev.value).to eq(@lentejas) #Lista = HEAD->Leche->Lentejas->Cola
	  end

	  it "Mostrar elementos de la lista de alimentos" do

	  expect(@List.to_s())
	  end
	end

	context "Pruebas de clases derivadas de Alimento" do
	  it "Instanciar alimentos para comprobar constructor y variables de instancias para las clases derivadas" do
		expect(@huevo.class).to eq(Alimento)
		expect(@pera.class).to eq(Alimentos_Dervivados)
		expect(@mantequilla.class).to eq(Alimentos_Dervivados)
		puts @huevo.to_s()
		puts @pera.to_s()
		puts @mantequilla.to_s()
		#Más el before que instancia y eso hace que compruebe
	  end

	  it "Comprobar clases y superclases, es decir, jerarquía de objetos" do

	  	expect(@calabaza.class).to eq(Alimentos_Dervivados)
	  	expect(@calabaza.is_a?Alimento).to eq(true)
	  	expect(@calabaza.is_a?Object).to eq(true)
	  	expect(@calabaza.is_a?BasicObject).to eq(true)
	  end
	end

	context "Pruebas de práctica 8 - Comparable + Enumerable + Comentarios" do
		it "Inlcuir módulo Comparable en la clase Alimento" do
			expect(@huevo > @pera).to eq(true) #kcal -> huevo = 231.9 | pera = 55.5
			expect(@huevo < @chocolate).to eq(true) #kcal -> chocolate = 479.2
			expect(@huevo < @leche).to eq(false)
		end

		it "Inlcuir módulo Enumerable en la clase Lista" do

			#expect(@List.sort(){|a,b| a <=> b}).to eq(true)
			expect(@List.sort).to eq([@leche])
			expect(@List.all?).to eq(true)
			expect(@List.any?).to eq(true)
			expect(@List.count).to eq(1) #
			expect(@List.detect { |i| i == @leche}).to eq(@leche)
			expect(@List.map{|i| i}).to eq([@leche])
			expect(@List.max).to eq(@leche)

		end
	end

	context "Pruebas de práctica 9 - Intento de programación funcional con ruby" do

		it "Introducir lista con los datos de alimentos por individuo" do

		    @List_aibc.insert_head(@I)
		    @List_aibc.insert_head(@H)
		    @List_aibc.insert_head(@G)
		    @List_aibc.insert_head(@F)

			expect(@List_aibc.map{|i| i}).to eq([@F.value,@G.value,@H.value,@I.value,nil])
		end
=begin		it "Comprobar "
		    #expect(@List_aibc.to_s())
			expect(@manzana.aibc_iterativo()).to eq(nil)


		end
=end
	end

end
