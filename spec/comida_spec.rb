require "spec_helper"

RSpec.describe Comida do

  it "has a version number" do
    expect(Comida::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

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
  end

  it "Instanciar alimentos para comprobar constructor y variables de instancias para proteinas, glúcidos y lípidos" do
	expect(@huevo.class).to eq(Alimento)
	#Más el before que instancia y eso hace que compruebe
  end

  it "Métodos getters" do
	expect(@huevo.proteinas).to eq(14.1)
  end

  it "Salida formateada" do
	expect(@huevo.to_s).to eq("huevo: tiene 14.1 gramos de proteinas, 0.0 gramos de glúcidos y 19.5 gramos de lípidos.")
  end
  
  it "Calcular valor energético del alimento" do
	expect(@huevo.valor_energetico).to eq(231.9)
  end
end
