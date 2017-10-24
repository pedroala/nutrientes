require "spec_helper"

RSpec.describe Comida do
  it "has a version number" do
    expect(Comida::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

  it "Instanciar alimentos para comprobar constructor y variables de instancias para proteinas, glúcidos y lípidos" do
	@huevo = 	Alimento.new(huevo,14.1,0.0,19.5)
  end
end
