
$(document).ready ->
	View.bindAll()

View = {
	# Binds all events
	bindAll: ->
		# Switching between categories
		$('#categories a').click (e) ->
			e.preventDefault()
			
			category = $(this).attr('href').split('#')[1]
			Controller.loadCategory( category )

		# Clicking on a menu item
		$('#menu li').live('click', ->
			itemid = $(this).data('itemid')

			Model.createOrder(itemid)
		)
	
	# Populates the central menu with a supplied list
	populateMenu: (list) ->
		menu = $('#menu')

		ul = $('<ul>')

		$.each(list, (k, item) ->
			li = $('<li>')
			li.data('itemid', item.id)

			# Header
			hDiv = $('<div>').addClass('header').appendTo(li)
			$('<h1>').html(item.name)
				.appendTo(hDiv)

			$('<p class="price">').html('$'+item.price.toFixed(2))
				.appendTo(hDiv)


			# Description
			$('<p class="desc">').html(item.description)
				.appendTo(li)

			# aaaaand append it all.
			ul.append(li)
		)

		menu.html(ul)
}

Controller = {
	loadCategory: (id) ->
		Model.findCategory(id, (data) ->
			View.populateMenu(data)
		)
}

Model = {
	findCategory: (id, callback) ->
		$.getJSON('/categories/'+id+'/items.json', (data) ->
			callback(data)
		)
	createOrder: (id) ->
		
}

