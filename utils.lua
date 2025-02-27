local Utils = {}

--recursive dump of array contents to string
function Utils.dumpList(list) 
    if type(list) == 'table' then
        local s = '{ '
        for k,v in pairs(list) do
           if type(k) ~= 'number' then k = '"'..k..'"' end
           s = s .. '['..k..'] = ' .. Utils.dumpList(v) .. ','
        end
        return s .. '} '
     else
        return tostring(list)
     end
end

return Utils