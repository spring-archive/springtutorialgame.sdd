--the simplest possible unit script would contain only the Create () and Killed function
local body = piece "body"

function script.Create()
	
end

function script.Killed(recentDamage, maxHealth)
	
end


function script.StartMoving ()
	Move (body, y_axis, 15, 30)
end

function script.StopMoving ()
	Move (body, y_axis, 0, 10)
end