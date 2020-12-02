ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('nek_gym:addItem')
AddEventHandler('nek_gym:addItem', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if item == 'protein_shake' and xPlayer.getMoney() >= Config['PriceProteinShake'] then
		xPlayer.removeMoney(Config['PriceProteinShake'])
		xPlayer.addInventoryItem(item, 1)
		TriggerClientEvent('esx:showNotification', _source, "Has comprado un batido de proteinas")
	elseif item == 'sportlunch' and xPlayer.getMoney() >= Config['Sportlunch'] then
		xPlayer.removeMoney(Config['Sportlunch'])
		xPlayer.addInventoryItem(item, 1)
		TriggerClientEvent('esx:showNotification', _source, "Has comprado una racion de comida deportiva")
	elseif item == 'powerade' and xPlayer.getMoney() >= Config['Powerade'] then
		xPlayer.removeMoney(Config['Powerade'])
		xPlayer.addInventoryItem(item, 1)
		TriggerClientEvent('esx:showNotification', _source, "Has comprado un powerade")
	end
end)

ESX.RegisterUsableItem('protein_shake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('protein_shake', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Has bebido un ~g~batido de proteinas')

end)

ESX.RegisterUsableItem('sportlunch', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sportlunch', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Has comido un ~g~almuerzo deportivo')

end)

ESX.RegisterUsableItem('powerade', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('powerade', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 700000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Has bebido un ~g~powerade')

end)
