function bad_square (n)
    k = 0
    while true do
        if k == (n*n) then
            return k
        end
        k = k + 1
    end
end

function real_square (n)
    return n * n
end
