local lmath = {}
lmath.vec2 = {}

--return the direction vec from vec1 to vec2
function lmath.vec2.dirTo (vec1, vec2)
    local dx = vec2.x - vec1.x
    local dy = vec2.y - vec1.y
    return { x = dx, y = dy }
end

--return the magnitude of the vector
function lmath.vec2.magnitude (vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y)
end

--return a normalized vector
function lmath.vec2.normalize(vec)
    local mag = lmath.vec2.magnitude(vec)
    if mag == 0 then
        return { x = 0, y = 0}
    else
        return {x = vec.x / mag, y = vec.y / mag}
    end
end

return lmath

