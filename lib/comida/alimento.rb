# encoding: utf-8
# Esta clase se ha creado para obtener
# el valor energético de un alimento
# haciendo uso del Lenguaje de Programación
# Ruby. Se ha incluido el módulo de Comparable.
# Author::    Pedro Lima  (mailto:alu0100952599@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

class Alimento
	include Comparable
	attr_reader :nombre, :proteinas, :glucidos, :lipidos, :valor_energetico, :g

	#Inicialización de un alimento por nombre, proteínas, ǵlúcidos y lípidos
	def initialize (nombre, pro, glu, lip, vector_al)

		@nombre = nombre
		@proteinas = pro
		@glucidos = glu
		@lipidos = lip

		@g = vector_al

		@valor_energetico = calcular_valor_energetico()
	end

	#Método para mostrar una salida formateada de un alimento
	def to_s

		"#{@nombre}: tiene #{@proteinas} gramos de proteinas, #{@glucidos} gramos de glúcidos y #{@lipidos} gramos de lípidos. Su valor energético es: #{@valor_energetico} Kcal"
	end

	#Calcular el valor energético de un alimento a través de sus proteinas, glúcidos y lípidos
	def calcular_valor_energetico
		@valor_energetico = (@proteinas+@glucidos)*4 + @lipidos*9
	end

	#Método de comparación para comparar alimentos y poder utilizar el módulo Comparable
	def <=> (other)
		return nil unless other.is_a? Alimento
		valor_energetico <=> other.valor_energetico
	end

	#Método de programación funcional
=begin	def aibc_iterativo

	i = 0
	r = []
	while i < g.size
		index = 1
		s = []
		while index < g[i].size
			if g[i][index] < g[i][0]
			s << 0.0
			else
			s << (((g[i][index] - g[i][0]) + (g[i][index-1] - g[i][0]))/2)*5
			end
			index = index + 1
		end
		r << s
		i = i + 1
	end
	suma = []
	j = 0
	while j < g.size
		k = 0
		s = 0
		while k < r[j].size
			s = s + r[j][k]
			k = k + 1
			end
			suma << s
			j = j + 1
		end
		suma
	end

	def aibc_funcional

		r = []
		aux = @g.each do
		end

	end
=end

end

# encoding: utf-8
# Esta clase se ha creado para obtener
# alimentos derivados con herencia
# haciendo uso del Lenguaje de Programación
# Ruby.  
# Author::    Pedro Lima  (mailto:alu0100952599@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby


class Alimentos_Dervivados < Alimento
	attr_reader :tipo

	#Inicialización de un alimento por nombre, proteínas, ǵlúcidos y lípidos
	def initialize (nombre, pro, glu, lip, vector_al, tipo)
		super(nombre, pro, glu, lip, vector_al)
		@tipo = tipo
	end

	#Método para mostrar una salida formateada de un alimento 
	def to_s
		s = ""
		s << super.to_s()
		s << " y es #{@tipo}."
		return s
	end
end

Node = Struct.new(:value, :next, :prev)

# encoding: utf-8
# Esta clase se ha creado para crear
# una lista que almacene alimentos y alimentos derivados
# haciendo uso del Lenguaje de Programación
# Ruby. Se han incluido los módulos de Enumerable y Comparable.  
# Author::    Pedro Lima  (mailto:alu0100952599@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

class Lista_Alimento
	include Enumerable, Comparable
	attr_reader :head, :cola

	#Inicialización de una lista vacía
	def initialize ()

		@head = Node.new()
		@cola = Node.new()
		
		@head.value = nil
		@head.prev = nil
		@head.next = @cola

		@cola.value = nil
		@cola.prev = @head
		@cola.next = nil
	end

	#Método para insertar por la cola un nodo
	def insertar (alimento) 

		aux2 = Node.new()
		aux2.value = alimento

		if defined?(@@number_of_nodes)
			@@number_of_nodes += 1
			aux = Node.new()

			aux = @cola.prev

			aux.next = aux2
			aux2.prev = aux
			aux2.next = @cola
			@cola.prev = aux2
		else
			#lista vacía - solo head y cola
			@@number_of_nodes = 1

			aux2.next = @cola
			aux2.prev = @head

			@head.next = aux2
			@cola.prev = aux2
		end
	end

	#Método para insertar por la cabeza un nodo
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

	#Método para eliminar por la cabeza un nodo y mostrarlo por pantalla
	def eliminar_head ()
			@@number_of_nodes -= 1
			aux = Node.new()
			aux2 = Node.new()

			aux = @head.next
			aux2 = aux.next
			aux2.prev = @head
			@head.next = aux2
			@head.prev = nil
			aux.prev = nil
			aux.next = nil

			puts "Elemento eliminado por la cabeza: #{aux.value}"

	end

	#Método para eliminar por la cola un nodo y mostrarlo por pantalla
	def eliminar_cola ()
			@@number_of_nodes -= 1
			aux = Node.new()
			aux2 = Node.new()

			aux = @cola.prev
			aux2 = aux.prev
			aux2.next = @cola
			@cola.prev = aux2
			@cola.next = nil
			aux.prev = nil
			aux.next = nil

			puts "Elemento eliminado por la cola: #{aux.value}"

	end

	#Método para mostrar una salida formateada de un alimento
	def to_s
		aux = []
		aux[0] = Node.new()
		aux[0] = @head
		i=0
		x = @@number_of_nodes -1
		while(x > i) do
			aux[i] = aux[i].next

			puts " Tamaño de la lista: #{x} alimentos ||"
			puts " Elemento: #{aux[i].value} ||"
			puts " ----------------------------------------"

			x -= 1
		end
	end

	#Método de comparasión para comparar alimentos y poder utilizar el módulo Comparable
	def <=> (another)
		aux = Node.new()

		self.Node.value <=> another.Node.value
	end

	#Método each para poder utilizar el módulo Enumerable
	def each

		aux = @head
		i=0
		y = @@number_of_nodes -1
		while(y > i) do
			aux = aux.next
			yield aux.value
			

			y -= 1
		end
	end
end
