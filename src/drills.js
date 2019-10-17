require("dotenv").config();
const knex = require("knex");

const knexInstance = knex({
  client: "pg",
  connection: process.env.DB_URL
});

console.log("knex and driver installed correctly");

/*
  view_id, 
  name, 
  price, 
  date_added, 
  checked, 
  category
  */

// 1. Get all items that contain text
function itemsWithText(searchTerm) {
  knexInstance
    .select("view_id", "name", "price", "date_added", "category")
    .from("shopping_list")
    .where("name", "ilike", `%${searchTerm}%`)
    .then(result => {
      console.log(result);
    });
}
//itemsWithText(" ");

// 2. Get all items paginated
function paginateItems(pageNumber) {
  const productsPerPage = 6;
  const offset = productsPerPage * (pageNumber - 1);
  knexInstance
    .select("view_id", "name", "price", "date_added", "checked", "category")
    .from("shopping_list")
    .limit(productsPerPage)
    .offset(offset)
    .then(result => {
      console.log(result);
    });
}
//paginateItems(3);

// 3. Get all items added after date
function productsAdded(daysAgo) {
  knexInstance
    .select("view_id", "name", "price", "date_added", "category")
    .from("shopping_list")
    .where(
      "date_added",
      ">",
      knexInstance.raw(`now() - '?? days'::INTERVAL`, daysAgo)
    )
    .then(result => {
      console.log(result);
    });
}
//productsAdded(5);

// 4. Get the total cost for each category
function categoryTotals() {
  knexInstance
    .select("category")
    .sum("price as total")
    .from("shopping_list")
    .groupBy("category")
    .then(result => {
      console.log(result);
      console.log("COST PER CATEGORY");
    });
}
categoryTotals();
