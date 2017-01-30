class Api::V1::BuscadorController <ApplicationController
	def index
	@fecha = params[:fecha]
	@folio = params[:folio]
	@cliente = params[:cliente]
	@nombre = params[:archivo]
	@referencia = params[:referencia]

	archivos = Archivo.where("(fecha = ?)", "#{params[:fecha]}")
		if archivos.blank? #Si no hace la busqueda por fecha, ahora busca por folio
				archivos = Archivo.where("(folio = ?)", "#{params[:folio]}")
				if archivos.blank? #Si no hace la busqueda por folio, ahora busca por folio
					archivos = Archivo.where("(cliente = ?)", "#{params[:cliente]}")
					if archivos.blank? #Si no hace la busqueda por cliente, ahora busca por archivo
						archivos = Archivo.where("(nombre = ?)", "#{params[:archivo]}")
						if archivos.blank? #Si no hace la busqueda por cliente, ahora busca por archivo
							archivos = Archivo.where("(referencia = ?)", "#{params[:referencia]}")
							if archivos.blank? #Si no hace la busqueda por cliente, ahora busca por archivo
								ar = archivos.map do |a|
								 {
								 	:descarga => a.photo,
								 	:fecha => a.fecha,
								 	:folio => a.folio, 
								 	:cliente => a.cliente,
								 	:archivo => a.nombre,
								 	:referecnia => a.referencia
								 }
								end
								render json: ar
							else
								ar = archivos.map do |a|
								 {
								 	:descarga => a.photo,
								 	:fecha => a.fecha,
								 	:folio => a.folio, 
								 	:cliente => a.cliente,
								 	:archivo => a.nombre,
								 	:referecnia => a.referencia
								 }
								end
								render json: ar
							end

						else
							ar = archivos.map do |a|
							 {
							 	:descarga => a.photo,
							 	:fecha => a.fecha,
							 	:folio => a.folio, 
							 	:cliente => a.cliente,
							 	:archivo => a.nombre,
							 	:referecnia => a.referencia
							 }
							end
							render json: ar
						end

					else
						ar = archivos.map do |a|
						 {
						 	:descarga => a.photo,
						 	:fecha => a.fecha,
						 	:folio => a.folio, 
						 	:cliente => a.cliente,
						 	:archivo => a.nombre,
						 	:referecnia => a.referencia
						 }
						end
						render json: ar
					end
				else
					#si encuentra resultador por folio pinta los resultados.
					ar = archivos.map do |a|
						 {
						 	:descarga => a.photo,
						 	:fecha => a.fecha,
						 	:folio => a.folio, 
						 	:cliente => a.cliente,
						 	:archivo => a.nombre,
						 	:referecnia => a.referencia
						 }
						end
					render json: ar
				end
		else
			#si encuentra resultador por fecha pinta los resultados.
			ar = archivos.map do |a|
				 {
				 	:descarga => a.photo,
				 	:fecha => a.fecha,
				 	:folio => a.folio, 
				 	:cliente => a.cliente,
				 	:archivo => a.nombre,
				 	:referecnia => a.referencia
				 }
				end
			render json: ar
		end
	end
end
