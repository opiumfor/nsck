-- Here we check whether the host listens given tcp port

-- stripe location part from uri
local port = ngx.var.uri:gsub('/port/','')
-- check if given port is listening via separate script
local script = '/scripts/port.sh ' .. port
local check = os.execute( script )

-- return the appropriate status code
ngx.status = check ==true and 200 or 500
ngx.say(check)
ngx.exit(ngx.OK)