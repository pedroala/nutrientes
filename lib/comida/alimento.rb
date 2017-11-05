



class Alimento

	

	attr_reader :nombre, :proteinas, :glucidos, :lipidos, :valor_energetico
	def initialize (nombre, pro, glu, lip)

		@nombre = nombre
		@proteinas = pro
		@glucidos = glu
		@lipidos = lip

		@valor_energetico = calcular_valor_energetico()
	end

	def to_s

		"#{@nombre}: tiene #{@proteinas} gramos de proteinas, #{@glucidos} gramos de glúcidos y #{@lipidos} gramos de lípidos. Su valor energético es: #{@valor_energetico} Kcal"
	end

	def calcular_valor_energetico
		@valor_energetico = (@proteinas+@glucidos)*4 + @lipidos*9
	end
end

Node = Struct.new(:value, :next, :prev)

class Lista_Alimento

	attr_reader :head, :cola
	def initialize ()

		@head = Node.new()
		@cola = Node.new()
		@vector_nodos = []

		@head.value = 0.0
		@cola.value = 0.0
	end

	def insertar (nodo1)

		if (@head.next == nil)	

			@vector_nodos[0] = Node.new()

			@vector_nodos[0].value = nodo1.value.nombre
			@vector_nodos[0].next = @cola.value
			@vector_nodos[0].prev = @head.value

			@head.next = @vector_nodos[0].value
			@cola.prev = @vector_nodos[0].value

		else
			

		end
	end

end
