-- a function that represents a disk
-- (a circular region) with center
-- (1.0, 3.0) and radius 4.5
function disk1 (x, y)
	return (x - 1.0)^2 + (y - 3.0)^2 <= 4.5^2
end

-- a disk factory
-- a call like disk(1.0, 3.0, 4.5) will
-- create a disk equal to disk1
function disk (cx, cy, r)
	return function (x, y)
		return (x - cx)^2 + (y - cy)^2 <= r^2
	end
end

-- a factory of axis-aligned rectangles,
-- given the bounds
function rect (left, right, bottom, up)
	return function (x, y)
		return left <= x and x<= right and
			   bottom <= x and x <= up
	end
end

-- how to modify and combine regions
function complement (r)
	return function (x, y)
		return not r(x, y)
	end
end

-- union, intersection and difference
-- of regions
function union (r1, r2)
	return function (x, y)
		return r1(x, y) or r2(x, y)
	end
end

function intersection (r1, r2)
	return function (x, y)
		return r1(x, y) and r2(x, y)
	end
end

function difference (r1, r2)
	return function (x, y)
		return r1(x, y) and not r2(x, y)
	end
end

-- function that translates by a given data
function translate (r, dx, dy)
	return function (x, y)
		return r(x - dx, y - dy)
	end
end

-- function to draw a region in a PBM file
function plot (r, M, N)
	io.write("P1\n", M, " ", N, "\n") -- header
	for i = 1, N do  -- for each line
		local y = (N - i*2)/N
		for j = 1, M do  -- for each column
			local x = (j*2 - M)/M
			io.write(r(x,y) and "1" or "0")
		end
		io.write("\n")
	end
end

-- example drawing a waxing crescent moon
c1 = disk(0, 0, 1)
plot(difference(c1, translate(c1, 0.3, 0)), 60, 25)
