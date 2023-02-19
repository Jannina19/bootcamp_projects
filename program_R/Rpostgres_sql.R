install.packages("RPostgreSQL")

library(RPostgreSQL)

con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "bjaibprg",
  port = 5432,
  user = "bjaibprg",
  password = "7jjiXT5pMABmnpkqb8ig2cK8wIDB8zU-"
)

# check table 
dbListTables(con)

students <- data.frame(
  id = 1:5,
  student_name = c("Lisa", "Jisoo", "Rose", "Jenny", "Milli")
)


store <- data.frame(
  id = 1:5,
  store_name = c("Central", "Jmart", "Lotus", "Markro", "FamilyMart"),
  daily_sales= c("200K","90k","150K","250K","150K")
)



#Put into server
dbWriteTable(con, "students", students)
dbWriteTable(con, "stores", store)


dbListTables(con)

### get data from students
df <- dbGetQuery(con, "SELECT * FROM stores")
st <- dbGetQuery(con, "SELECT * FROM students")


### CLOSE connection
dbDisconnect(con)
