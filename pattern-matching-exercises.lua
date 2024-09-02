function split (s, delimiter)
    s = s or ""
    delimiter = delimiter or " "
    t = {}

    for chunk in string.gmatch(s, "[(^delimiter)+]") do 
        t[#t + 1] = chunk
    end

    return t
end

function iterate (t)
    t = t or {}
    for _, v in ipairs(t) do 
        print(v)
    end
end
