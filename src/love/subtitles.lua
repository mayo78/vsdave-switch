local test = 'ok this is a test'
local index = 0

while index < #test do
	print(test:sub(1, index))
	index = index + 1
end
print('lol')