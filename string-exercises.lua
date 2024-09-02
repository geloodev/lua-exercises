function insert (s1, pos, s2)
    newstring1 = string.sub(s1, 1, pos - 1)
    newstring2 = string.sub(s1, pos, -1)
    print(newstring1 .. s2 .. newstring2)
end

function insert_utf8 (s1, pos, s2)
    newstring1 = string.sub(s1, utf8.offset(s1, 1), utf8.offset(s1, pos - 1))
    newstring2 = string.sub(s1, utf8.offset(s1, pos), utf8.offset(s1, -1))
    print(newstring1 .. s2 .. newstring2)
end

function remove (s, pos, l)
    newstring1 = string.sub(s, 1, pos - 1)
    newstring2 = string.sub(s, pos + l, -1)
    print(newstring1 .. newstring2)
end

function remove_utf8 (s, pos, l)
    newstring1 = string.sub(s, utf8.offset(s, 1), utf8.offset(s, pos - 1))
    newstring2 = string.sub(s, utf8.offset(s, pos + l), utf8.offset(s, -1))
    print(newstring1 .. newstring2)
end

function ispali (s)
    return s == string.reverse(s)
end
