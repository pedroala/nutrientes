



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

#derivar clases de alimento aquí

Node = Struct.new(:value, :next, :prev)

class Lista_Alimento

	attr_reader :head, :cola, :vector_nodos
	def initialize ()

		@head = Node.new()
		@cola = Node.new()
		@vector_nodos = []

		@head.value = 0.0
		@cola.value = 0.0
	end

	def insertar (nodo1) #como siguiente nodo

		

		if defined?(@@number_of_nodes)
			@@number_of_nodes += 1
			@vector_nodos [@@number_of_nodes] = Node.new()
			@vector_nodos[@@number_of_nodes].value = nodo1.value.nombre
			@vector_nodos[@@number_of_nodes].next = @cola.value
			@vector_nodos[@@number_of_nodes].prev = @vector_nodos[@@number_of_nodes - 1].value

			@vector_nodos[@@number_of_nodes - 1].next = @vector_nodos[@@number_of_nodes].value
			@cola.prev = @vector_nodos[@@number_of_nodes].value

		else
			#lista vacía - solo head y cola
			@@number_of_nodes = 0
			@vector_nodos [@@number_of_nodes] = Node.new()

			@vector_nodos[@@number_of_nodes].value = nodo1.value.nombre
			@vector_nodos[@@number_of_nodes].next = @cola.value
			@vector_nodos[@@number_of_nodes].prev = @head.value

			@head.next = @vector_nodos[@@number_of_nodes].value
			@cola.prev = @vector_nodos[@@number_of_nodes].value
		end
	end

	def insert_head (nodo2)

		if defined?(@@number_nodes_head)
			@@number_nodes_head += -1
			@vector_nodos [@@number_nodes_head] = Node.new()

			@vector_nodos[@@number_nodes_head].value = nodo2.value.nombre
			@vector_nodos[@@number_nodes_head].next = @vector_nodos[@@number_nodes_head + 1].value
			@vector_nodos[@@number_nodes_head].prev = @head.value

			@vector_nodos[@@number_nodes_head + 1].prev = @vector_nodos[@@number_nodes_head].value
			@head.next = @vector_nodos[@@number_nodes_head].value

		else	#primer nodo insertado por la cabeza
			@@number_nodes_head = -1
			@vector_nodos [@@number_nodes_head] = Node.new()

			@vector_nodos[@@number_nodes_head].value = nodo2.value.nombre
			@vector_nodos[@@number_nodes_head].next = @vector_nodos[0].value
			@vector_nodos[@@number_nodes_head].prev = @head.value

			@head.next = @vector_nodos[@@number_nodes_head].value
			@vector_nodos[0].prev = @vector_nodos[@@number_nodes_head].value

		end
	end

	def eliminar_head ()

		if (@head.next != nil)
			@@number_nodes_head += 1

			@head.next = @vector_nodos[@@number_nodes_head].value
			@vector_nodos[@@number_nodes_head].prev = @head.value
		end

	end


end
