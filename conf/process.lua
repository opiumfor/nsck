-- Here we check whether given process is running on the host

-- stripe location part from uri
local process = ngx.var.uri:gsub('/process/','')

function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

-- perform the query
local script = '/scripts/process.py ' .. process
local exitCode = os.execute( script )
local body = os.capture( script )

-- return the appropriate status code
ngx.status = exitCode ==true and 200 or 500
ngx.say(body)
ngx.exit(ngx.OK)