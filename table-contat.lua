function create_table (size)
    t = {}
    for i = 1, size do 
        t[i] = i
    end
    return t
end

function table_concat (t)
    string = ""
    for i = 1, #t do
        string = string .. t[i]
    end
    print(string)
end
