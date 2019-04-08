print("Hello World")
-- Single-line comments
--[[
multi-line comments
]]
name = "Hunter" --variable automatically becomes String type because value is String
io.write("Size of string ", #name, "\n") --writes the size of the string value for name var and creates a newline at the end
-- \b = backspace, \t = tab, \\ = backslash, \" = double quotes, \' = single quotes
name = 4 --reassigns var name to int 
io.write("My name is ", name, "\n") --my name is 4
bigNum = 9223372036854775807 --largest int number avaialble in lua
io.write("Big Number ", type(bigNUm), "\n") --checks var type of bigNum
floatPrecision = 1.999999999999 + 0.0000000000005 -- precise up to 13 digits
io.write(floatPrecision)
name = "Hunter"
longString = [[
I am a very very long
string that
goes on forever
]]
longString = longString .. name -- concatenates the longString var and the name var 
io.write(longString, "\n")
isAbleToDrive = true
io.write(type(isAbleToDrive), "\n") --outputs type is boolean
io.write(type(madeUpVar), "\n") --gets value of nil if not assigned

--math functions
--math.floor(x)
--math.ceil(x)
--math.max(x, ...)
--math.min(x, ...)
--math.sin(x)
--math.cos(x)
--math.tan(x)
--math.asin(x)
--math.acos(x)
--math.exp(x)
--math.log(x)
--math.log10(x)
--math.pow(x, y)
--math.sqrt(x)
--math.random(m, n)
--math.randomseed(x)

io.write("5 + 3 = ", 5+3, "\n")
io.write("5 - 3 = ", 5-3, "\n")
io.write("5 * 3 = ", 5*3, "\n")
io.write("5 / 3 = ", 5/3, "\n")
io.write("5.2 % 3 = ", 5%3, "\n") --modulus operator
io.write("floor(2.345) : ", math.floor(2.345), "\n") --rounds number down
io.write("ceil(2.345) : ", math.ceil(2.345), "\n") --rounds number up
io.write("max(2, 3) : ", math.max(2, 3), "\n")
io.write("min(2, 3) : ", math.min(2, 3), "\n")
io.write("pow(8, 2) : ", math.pow(8, 2), "\n")
io.write("sqrt(64) : ", math.sqrt(64), "\n")

number++ --not allowed
number-- --not allowed
number +=1 --not allowed

io.write("math.random() : ", math.random(), "\n") --between 0 and 1
io.write("math.random(10) : ", math.random(10), "\n") --between 1 and 10
io.write("math.random(5,100) : ", math.random(5,100), "\n") --random between 5 and 100
math.randomseed(os.time()) -- generates random value

print(string.format("Pi = %.10f", math.pi)) --formats the number of Pi to the 10th decimal with floatPrecision


-- Relational Operators : > < >= <= == ~=
-- Logical Operators and or not

age = 13
if age < 16 then
  io.write("You can go to school", "\n")
  local localVar = 10 --local variables are local to nested if statement, cannot be found outside if statement
elseif (age <= 16) and (age <= 18) then
  io.write("You can drive", "\n")
else
  io.write("You can vote", "\n")
end
print(localVar) --comes back as nil because its called outside of if statement

age = 13
if(age < 14) or (age > 67) then io.write("You shouldn't work\n") end --works but is sloppy
print(string.format("not true = %s", tostring(not true))) --%s sets format to string, outputs false
canVote = age > 18 ? true : false --no ternary operator in lua
canVote = age > 18 and true or false --works like ternary operator in lua
io.write("can i vote : ", tostring(canVote))
  


--String Operators
quote = "I changed my password to incorrect. So that when i forget it, it always reminds me, Your password is incorrect."

io.write("Quote Length ", string.len(quote), "\n") --comes back at 111 characters
io.write("Quote Length ", #quote, "\n") --comes back at 111 characters (most common way to check character length)
io.write("Replace I with me ", string.gsub(quote, "I", "me"), "\n") --replaces "I" with "me" in the quote string
io.write("Quote Upper : ", string.upper(quote), "\n") --converts string to uppercase
io.write("Quote Lower : ", string.lower(quote), "\n") --converts string to lowercase



--Looping
i = 1 --initalize a var 
while (i <= 10) do
  io.write(i)
  i = i + 1
  if i == 8 then break end --breaks out of while loop if i = 8
end 
print("\n")

repeat
  io.write("Enter your guess : ")
  guess = io.read() -- keyboard input
until tonumber(guess) == 15 --repeat question until guess is 15

for i = 1, 10, 1 do --between 1 and 10, for each increment of 1, write the number
  io.write(i)
end


--table
months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
for key, value in pairs(months) do
  io.write(value, " ") --outputs values of months table with space between each
end


aTable = {}
for i = 1, 10 do
  aTable[i] = i
end 
io.write("First : ", aTable[1], "\n") --outputs first item value
io.write("Number of Items : ", #aTable, "\n") --outputs number of items in table
table.insert(aTable, 1, 0) --inserts first row in table, set as 0
io.write("First : ", aTable[1], "\n") --outputs first item value
print(table.concat(aTable, ", ")) --converts table to String
table.remove(aTable, 1) --removes index from table 


--Multi dimensional tables
aMultiTable = {}

for i = 0, 9 do
  aMultiTable[i] = {}
  for j = 0, 9 do
    aMultiTable[i][j] = tostring(i) .. tostring(j)
  end 
end 

io.write("Table[1][2] : ", aMultiTable[1][2], "\n") --outputs value of i1 and j2

for i = 0, 9 do
  aMultiTable[i] = {}
  for j = 0, 9 do
    io.write(aMultiTable[i][j], " : ")
  end 
  print()
end 



--Functions 
function getSum(num1, num2)
  return num1 + num2
end

print(string.format("5 + 2 = %d", getSum(5,2))) --ca;culates sum of values 5 and 2

function splitStr(theString)
  stringTable = {}
  local i = 1
  for word in string.gmatch(theString, "[^%s]+") do --capture characters until you reach a space (%s)
  stringTable[i] = word 
  i = i + 1
end 
return stringTable, i
end 

splitStrTable, numOfStr = splitStr("The turtle")
for j = 1, numOfStr - 1  do 
  print(string.format("%d : %s", j, splitStrTable[j]))
end


function getSumMore(...)
  local sum = 0
  for k, v in pairs{...} do
    sum = sum + v
  end 
  return sum 
end 
io.write("Sum ", getSumMore(1,2,3,4,5,6), "\n") --get the sum of an undefined number of values, loops through table


doubleIt = function(x) return x * 2 end 
print(doubleIt(4))

--enclosure functions
function outerFunc()
  local i = 0
  return function()
    i = i + 1
    return i 
  end 
end 

getI = outerFunc()
print(getI()) --outputs 1
print(getI()) --outputs 2


--co-routine
co = coroutine.create(function()
for i = 1, 10, 1 do
print(i)
print(coroutine,status(d))
if i == 5 then coroutine.yield() end
end 
end)

print(coroutine.status(co))
coroutine.resume(co)

print(coroutine.status(co))

co2 = coroutine.create(function()
for i = 101, 110, 1 do
print(i)
end end)
coroutine.resume(co2)
coroutine.resume(co)
print(coroutine.status(co))


-- file.io
-- r: Read only (default)
-- w: Overwrite or create a new file 
-- a: Append or create a new file 
-- r+: Read & write existing file 
-- w+: Overwrite read or create a new file 
-- a+: Append read or create file 

file = io.open("text.lua", "w+") --created test.lua and able to write to it
file:write("Random string of text\n") --writes to test.lua
file:write("Some more text\n") --writes to test.lua again
file:seek("set", 0) --jumps to top of file
print(file:read("*a")) --read test.lua
file:close() --close file from io.open

file = io.open("text.lua", "a+")
file:write("Even more text\n")
file:seek("set", 0)
print(file:read("a"))
file:close()



--Modules
--module name and filename should be same 
---- convert.lua 
local convert = {}
function convert.ftToCm(feet)
  return feet + 30.48
end 
return convert 

---- main.lua 
convertModule = require("convert") --must be in same directory as convert.lua
print(string.format("%.3f cm", convertModule.ftToCm(12))) --Returns 42.480 cm




-- Meta Tables
aTable = {}
for x = 1, 10 do
  aTable[x] = x
end 

mt = {
  --__sub __mul __div __mod __concat .. __add __lt __le
  __add = function(table1, table2)
    sumTable = {}
    
    for y = 1, #table1 do
      if(table1[y] ~= nil) and (table2[y] ~= nil) then
        sumTable[y] = table1[y] + table2[y]
      else 
        sumTable[y] = 0
      end 
    end 
    return sumTable
  end,
  
  __eq = function(table1, table2)
    return table1.value = table2.value 
  end,
}

setmetatable(aTable, mt)
print(aTable == aTable)
addTable = {}
addTable = aTable + aTable 
for z = 1, #addTable do
  print(addTable[z])
end 


-- Object-Oriented Programming
Animal = {height = 0, weight = 0, name = "No Name", sound ="No Sount"}
function Animal:new(height, weight, name, sound)
  setmetatable({}, Animal)
  self.height = height
  self.weight = weight
  self.name = name
  self.sound = sound
  
  return self
end 

function Animal:toString(
  animalStr = string.format("%s weighs %.1f lbs, is %.1f in tall and says %s", self.name, self.weight, self.height, self.sound)
  return animalStr
end 
)

spot = Animal:new(10, 15, "Spot", "Woof")
print(spot.weight)
print(spot.toString())

Cat = Animal:new()

function Cat:new(height, weight, name, sound, favFood)
  setmetatable({}, Cat)
  self.height = height
  self.weight = weight
  self.name = name
  self.sound = sound
  self.favFood = favFood
  
  return self
end 

function Cat:toString(
  CatStr = string.format("%s weighs %.1f lbs, is %.1f in tall and says %s and loves %s", self.name, self.weight, self.height, self.sound, self.favFood)
  return CatStr
end

fluffy = Cat:new(10, 15, "Fluffy", "Meow", "Tuna")
print(fluffy:toString())