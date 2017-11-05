require "spec_helper"

RSpec.describe Comida do

  before :all do
    @huevo = 	Alimento.new("huevo",14.1,0.0,19.5)
	@leche = 	Alimento.new("leche",3.3,4.8,3.2)
	@yogurt = 	Alimento.new("yogurt",3.8,4.9,3.8)
	@cerdo = 	Alimento.new("cerdo",21.5,0.0,6.3)
	@ternera = 	Alimento.new("ternera",21.1,0.0,3.1)
	@pollo = 	Alimento.new("pollo",20.6,0.0,5.6)
	@bacalao = 	Alimento.new("bacalao",17.7,0.0,0.4)
	@atun = 	Alimento.new("atun",21.5,0.0,15.5)
	@salmon = 	Alimento.new("salmon",19.9,0.0,13.6)
	@aceite = 	Alimento.new("aceite",0.0,0.2,99.6)
	@chocolate =Alimento.new("chocolate",5.3,47.0,30.0)
	@azucar =	Alimento.new("azucar",0.0,99.8,0.0)
	@lentejas =	Alimento.new("lentejas",23.5,52.0,1.4)
	@papas = 	Alimento.new("papas",2.0,15.4,0.1)
	@tomate = 	Alimento.new("tomate", 1.0,3.5,0.2)
	@cebolla = 	Alimento.new("cebolla",1.3,5.8,0.3)
	@manzana = 	Alimento.new("manzana",0.3,12.4,0.4)
	@platanos = Alimento.new("platanos",1.2,21.4,0.2)
	@A = Node.new(@huevo,2,nil)
	@B = Node.new(@leche,3,nil)
	@List = Lista_Alimento.new()
  end
	context "Pruebas clase Alimento" do
	  it "Instanciar alimentos para comprobar constructor y variables de instancias para proteinas, glúcidos y lípidos" do
		expect(@huevo.class).to eq(Alimento)
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

	  	expect(@List.head.next).to eq(nil)
	  	expect(@List.head.prev).to eq(nil)
	  	expect(@List.head.value).to eq(0.0)

	  end

	  it "Insertar un elemento en la lista" do
	  	@List.insertar(@A)
	  	expect(@List.head.next).to eq(@huevo.nombre)
	  	expect(@List.head.prev).to eq(nil)
	  	expect(@List.head.value).to eq(0.0)
	  	expect(@List.cola.prev).to eq(@huevo.nombre)

	  	@List.insertar(@B)
	  	expect(@List.head.next).to eq(@huevo.nombre)
	  	expect(@List.head.prev).to eq(nil)
	  	expect(@List.head.value).to eq(0.0)
	  	expect(@List.vector_nodos[1].value).to eq(@leche.nombre) #vector_nodos[1] porque el 0 es huevo
	  	expect(@List.cola.prev).to eq(@leche.nombre)
	  end
	end
end
