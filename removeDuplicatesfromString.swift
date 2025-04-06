
let log_dump = "name=John Trust, username=john3, email=john3@gmail.com, id=434453; name=Hannah Smith, username=hsmith, email=hsm@test.com, id=23312; name=Hannah Smith, username=hsmith, id=3223423, email=hsm@test.com; name=Robert M, username=rm44, id=222342, email=rm@me.com; name=Robert M, username=rm4411, id=5535, email=rm@me.com; name=Susan Vee, username=sv55, id=443432, email=susanv123@me.com; name=Robert Nick, username=rnick33, id=23432, email=rnick@gmail.com; name=Robert Nick II, username=rnickTemp34, id=23432, email=rnick@gmail.com; name=Susan Vee, username=sv55, id=443432, email=susanv123@me.com;"


let array  = log_dump.split(separator: ";")
var userNameArr:Set<String> = []

for name in array {
    
    let nameArr = name.components(separatedBy: ",")
    let filteredNameArr = nameArr.filter{!$0.contains("id")}
    let filteredString = filteredNameArr.joined(separator: ",")
    userNameArr.insert(filteredString)
}

print(userNameArr)
let result1 = userNameArr.joined(separator: ";")
print(result1)