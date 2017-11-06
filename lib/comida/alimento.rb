



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

	attr_reader :head, :cola
	def initialize ()

		@head = Node.new()
		@cola = Node.new()
		
		@head.value = 0.0
		@head.prev = nil
		@head.next = @cola

		@cola.value = 0.0
		@cola.prev = @head
		@cola.next = nil
	end

	def insertar (nodo1) #como siguiente nodo - cola

		

		if defined?(@@number_of_nodes)
			@@number_of_nodes += 1
			aux = Node.new()

			aux = @cola.prev

			aux.next = nodo1
			nodo1.prev = aux
			nodo1.next = @cola
			@cola.prev = nodo1

		else
			#lista vacía - solo head y cola
			@@number_of_nodes = 1

			nodo1.next = @cola
			nodo1.prev = @head

			@head.next = nodo1
			@cola.prev = nodo1
		end
	end

	def insert_head (nodo2)

		if defined?(@@number_of_nodes)
			@@number_of_nodes += 1
			aux = Node.new()

			aux = @head.next

			aux.prev = nodo2
			nodo2.prev = @head
			nodo2.next = aux
			@head.next = nodo2

		else
			#lista vacía - solo head y cola
			@@number_of_nodes = 1

			nodo2.next = @cola
			nodo2.prev = @head

			@head.next = nodo2
			@cola.prev = nodo2
		end
	end

	def eliminar_head ()

		
			@@number_of_nodes -= 1
			aux = Node.new()
			aux2 = Node.new()

			aux = @head.next
			aux2 = aux.next

			@head.next = aux2
			@head.prev = nil

	end

	def eliminar_cola ()

			@@number_of_nodes -= 1
			aux = Node.new()
			aux2 = Node.new()

			aux = @cola.prev
			aux2 = aux.prev

			@cola.prev = aux2
			@cola.next = nil
	end

	def to_s

			aux = Node.new()
			aux = @head

			puts "#{aux.next}"
	end

	

end
