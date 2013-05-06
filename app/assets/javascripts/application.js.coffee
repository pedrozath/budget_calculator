#= require jquery
#= require jquery_ujs
#= require format_currency
#= require_tree .

$ ->
	class Budget
		constructor: (@form) ->
			@form = $(@form)
			@inputs = @form.find("input[type=text]")
			do @user_interaction

		get_values: =>
			for variable in ["salario_mensal", "margem_de_reserva", "margem_de_lucro", "impostos", "taxa_de_urgencia", "tempo_gasto"]
				@[variable] = eval $("#budget_#{variable}").val()
	
		user_interaction: =>
			$("input").keyup =>
				if @validate() then @display @calculate()

		validate: =>
			fields_with_error = []
			@inputs.each ->
				fields_with_error.push this if $(this).val() == ""
			fields_with_error.length == 0

		display: (contents) =>
			$(".valor").html(contents).formatCurrency
				decimalSymbol: "."
				digitGroupSymbol: ","

		calculate: =>
			do @get_values
			console.log @salario_mensal
			custo_hora = @salario_mensal/22/8
			taxas = (@margem_de_reserva + @margem_de_lucro + @impostos + @taxa_de_urgencia)/100
			console.log taxas, (1-taxas)
			(custo_hora * @tempo_gasto) / (1-taxas)

	new Budget ".budget"