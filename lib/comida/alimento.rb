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
	def initialize (nombre, pro, glu, lip, lista_al)

		@nombre = nombre
		@proteinas = pro
		@glucidos = glu
		@lipidos = lip

		@g = lista_al #Lista de 2 listas de valores - Una por cada individuo

		@valor_energetico = calcular_valor_energetico()
	end

	#Método para mostrar una salida formateada de un alimento
	def to_s

		"#{@nombre}: tiene #{@proteinas} gramos de proteinas, #{@glucidos} gramos de glúcidos y #{@lipidos} gramos de lípidos. Su valor energético es: #{@valor_energetico} Kcal"
	end

	#Calcular el valor energético de un alimento a través de sus proteinas, glúcidos y lípidos
	def calcular_valor_energetico
		@valor_energetico = (@proteinas+@glucidos)*4 + @lipidos*9
		@valor_energetico = @valor_energetico.round(2)
	end

	#Método de comparación para comparar alimentos y poder utilizar el módulo Comparable
	def <=> (other)
		return nil unless other.is_a? Alimento
			valor_energetico <=> other.valor_energetico
	end
#Método para calcular el AIBC de un alimento por medio del paragidma de programación funcional, donde:
#g representa una lista de listas  | l será un nodo de esa lista compleja 
#l.value una lista de un individuo | j será un nodo de la lista de individuo
#g.head.next.value -> lista de un individuo y con la variable de instancia Tam conseguimos el size.
#Con 'take' separo según el número de individuos
	def aibc_funcional

		r = []
		s = []
		@@Tamaño_muestra = @g.head.next.value.Tam
		
		@g.map do |l| 
			l.value.map do |j| 
				if (j.value != l.value.head.next.value)
						if j.value < l.value.head.next.value
							s << 0.0
						else
							s << (( (j.value - l.value.head.next.value) + (j.prev.value - l.value.head.next.value) )/2) *5
						end
				else
				end
			end
		end

		r[0] = s.take(@@Tamaño_muestra).reduce(:+)
		r[1] = (s - s.take(@@Tamaño_muestra)).reduce(:+)
		suma = [r[0],r[1]]

	end
#Método para calcular el Índice glucémico de un alimento, le pasamos el aibc de la glucosa (azucar)
#self es para llamar al alimento del cual queremos calcular el IG y self.g.Tam es para saber cuantos
#individuos hay en la muestra.
	def IG (glucosa)

		i = []
		self.aibc_funcional().zip(glucosa).map do |x|		
			i << x.inject(:/)
		end
		i.map{|n| n*(100/self.g.Tam)}.inject(:+)
	end

end

# encoding: utf-8
# Esta clase se ha creado para obtener
# alimentos derivados con herencia
# haciendo uso del Lenguaje de Programación
# Ruby.  
# Author::    Pedro Lima  (mailto:alu0100952599@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby


class Alimentos_Derivados < Alimento
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

class Struct
	include Comparable, Enumerable

	def <=> (another)
		return nil unless another.is_a? Node
		self.value <=> another.value
	end

	def each
		aux = self.value
		yield aux.value
	end

end
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
	attr_reader :head, :cola, :Tam

	#Inicialización de una lista vacía
	def initialize ()

		@head = Node.new()
		@cola = Node.new()
		@Tam = 0
		
		@head.value = -1.0
		@head.prev = nil
		@head.next = @cola

		@cola.value = -1.0
		@cola.prev = @head
		@cola.next = nil
	end

	#Método para insertar por la cola un nodo
	def insertar (alimento) 

		aux2 = Node.new()
		aux2.value = alimento

		if defined?(@@number_of_nodes == 0)
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
		@Tam += 1
	end

	#Método para insertar por la cabeza un nodo
	def insert_head (alimento)

		aux2 = Node.new()
		aux2.value = alimento

		if defined?(@@number_of_nodes == 0)
			@@number_of_nodes += 1
			aux = Node.new()

			aux = @head.next
			aux.prev = aux2

			aux2.prev = @head
			aux2.next = aux
			@head.next = aux2

		else
			#lista vacía - solo head y cola
			@@number_of_nodes = 1

			aux2.next = @cola
			aux2.prev = @head

			@head.next = aux2
			@cola.prev = aux2
		end
		@Tam += 1
	end

	#Método para eliminar por la cabeza un nodo y mostrarlo por pantalla
	def eliminar_head ()
			@@number_of_nodes -= 1
			@Tam -= 1
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
			@Tam -= 1
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
		aux = @head
		i=1
		x = @Tam
		while(x > i) do
			
			aux = aux.next

			puts " Nombre: #{aux.value.nombre} || Valor Energético: #{aux.value.valor_energetico} || G: #{aux.value.glucidos} || P: #{aux.value.proteinas} || L: #{aux.value.lipidos}"
			puts " *------------------------------------------------------------------------------------------*"

			x = x - 1

		end
		if (aux.next != nil) 
			puts " Nombre: #{aux.next.value.nombre} || Valor Energético: #{aux.next.value.valor_energetico} || G: #{aux.next.value.glucidos} || P: #{aux.next.value.proteinas} || L: #{aux.next.value.lipidos}"
			puts " *------------------------------------------------------------------------------------------*"
			puts " Tamaño de la lista: #{@Tam} alimentos ||"
		end
	end

	#Método de comparasión para comparar alimentos y poder utilizar el módulo Comparable
#	def <=> (another)
#		aux = Node.new()
#
#		self <=> another
#	end

	#Método each para poder utilizar el módulo Enumerable
	def each

		aux = @head
		i=1
		y = @Tam
		while(y > i) do
			aux = aux.next
			yield aux.value
			y -= 1
		end
		if (aux.next != nil) 
			yield aux.next.value
		else
		end
	end

	#Métodos práctica 10 - ordenación
=begin
	def ordenar_each_list 

		aux = Lista_Alimento.new()

		self.each do |l|
			#aux.insertar(lista.min)
			aux.inject do |min, other|
   				if min > other 
   					aux << other
   				else
   					aux << min 
   				end
			end
		end
		aux
	end
=end
=begin
	def ordenar_for_list

		aux = false
		aux_node = Node.new()
		aux_node = self.head.next
		aux2 = Node.new()

		#lista = Lista_Alimento.new()

		while !aux

			aux = true

			while aux_node.next != nil

				if aux_node.value > aux_node.next.value

					aux2.value = aux_node.next.value
					aux2.next = aux_node.next.next
					aux2.prev = aux_node.next.prev

					aux_node.next.value = aux_node.value
					aux_node.next.next = aux_node.next
					aux_node.next.prev = aux_node.prev

 					aux_node.value = aux2.value
 					aux_node.prev = aux2.prev
 					aux_node.next = aux2.next

					aux = false
				end
			end
		end
		#self
	end

=end

end

# encoding: utf-8
# Esta clase derivada se ha creado para crear
# una lista que almacene datos de alimentos para calcular AIBC e IG
# haciendo uso del Lenguaje de Programación
# Ruby. Se han incluido los módulos de Enumerable y Comparable.  
# Author::    Pedro Lima  (mailto:alu0100952599@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

class Lista_p09 < Lista_Alimento

	def each
		aux = @head
		i=1
		y = @Tam
		while(y > i) do
			aux = aux.next
			yield aux
			y -= 1
		end
		if (aux.next != nil) 
			yield aux.next
		else
		end
	end
end

class Array

def quicksort(array)
    if array.length < 1
  		return array
  	else
		  pivot = array.sample
		  array.delete_at(array.index(pivot)) 

		  less = []
		  greater = []

		array.each do |x|
		   if x <= pivot
		     less << x
		   else
		     greater << x
		   end
		 end
	end
  sorted_array = []
  sorted_array << array.quicksort(less)
  sorted_array << pivot
  sorted_array << array.quicksort(greater)
  sorted_array.flatten
end

	def ordenar_for_vec

		aux = false

		while !aux

			aux = true

			for i in 0..(self.size()-2)

				if self[i] > self[i+1]
					aux2 = self[i+1]
					self[i+1] = self[i]
					self[i] = aux2
					aux = false
				end
			end
		end
		self
	end

	def ordenar_for_matrix

		aux = false

		while !aux

			aux = true

			for i in 0..(self.size()-1)
				for j in 0..(self[i].size()-2)

					if self[i][j] > self[i][j+1]
						aux2 = self[i][j+1]
						self[i][j+1] = self[i][j]
						self[i][j] = aux2
						aux = false
					end
				end
			end
		end
		self
	end

	def to_s
		for i in 0..(self.size()-1)
			puts "...................................................................................."
			puts "Tipo: #{self[i].tipo} || Nombre: #{self[i].nombre} || Valor energético: #{self[i].valor_energetico}"
		end
	end

	def to_s_matrix
		for i in 0..(self.size()-1)
			puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
			puts "Tipo: #{self[i][0].tipo}"
			puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
			for j in 0..(self[i].size()-1)
				puts "Nombre: #{self[i][j].nombre} || Valor energético: #{self[i][j].valor_energetico}"
			end
		end
	end

end
