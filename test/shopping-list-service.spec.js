const ShoppingListService = require("../src/shopping-list-service");
const knex = require("knex");

//(name, price, category, checked, date_added)
describe("Shopping List service object", function() {
  let db;
  let testItems = [
    {
      view_id: 1,
      name: "Not Dogs",
      price: `4.99`,
      category: "Breakfast",
      //checked: true,
      date_added: new Date("2029-01-22T16:28:32.615Z")
    },
    {
      view_id: 2,
      name: "Bluffalo Wings",
      price: `5.5`,
      category: "Snack",
      //checked: false,
      date_added: new Date("2100-05-22T16:28:32.615Z")
    },
    {
      view_id: 3,
      name: "Potato Chips",
      price: `1.5`,
      category: "Snack",
      //checked: false,
      date_added: new Date("2100-03-22T16:28:32.615Z")
    }
  ];

  before(() => {
    db = knex({
      client: "pg",
      connection: process.env.TEST_DB_URL_
    });
  });

  before(() => db("shopping_list").truncate()); //this removed all data from table
  afterEach(() => db("shopping_list").truncate()); //eliminates test leaks
  after(() => db.destroy());

  context("Given 'shopping_list' has data", () => {
    beforeEach(() => {
      return db.into("shopping_list").insert(testItems);
    });

    it('updateItem() updates an item from the "shopping_list" table', () => {
      const idOfItemToUpdate = 3;
      const newItemData = {
        name: "updated name",
        price: `1.25`,
        //category: "updated category",
        checked: true,
        date_added: new Date()
      };
      const originalItem = testItems[idOfItemToUpdate - 1];
      return ShoppingListService.updateItem(db, idOfItemToUpdate, newItemData)
        .then(() => ShoppingListService.getById(db, idOfItemToUpdate))
        .then(item => {
          expect(item).to.eql({
            view_id: idOfItemToUpdate,
            ...originalItem,
            ...newItemData
          });
        });
    });
    it('deleteItem() removes an item by id from "shopping_list" table', () => {
      const itemId = 3;
      return ShoppingListService.deleteItem(db, itemId)
        .then(() => ShoppingListService.getAllItems(db))
        .then(allItems => {
          //copy the test items array without the "deleted" item
          const expected = testItems
            .filter(item => item.id !== itemId)
            .map(item => ({
              ...item,
              checked: false
            }));
          expect(allItems).to.eql(expected);
        });
    });
    //
    it('getById() resoloves an item by id from "shopping_list" table', () => {
      const thirdId = 3;
      const thirdTestItem = testItems[thirdId - 1];
      return ShoppingListService.getById(db, thirdId).then(actual => {
        expect(actual).to.eql({
          view_id: thirdId,
          name: thirdTestItem.name,
          price: thirdTestItem.price,
          category: thirdTestItem.category,
          checked: false,
          date_added: thirdTestItem.date_added
        });
      });
    });
    it("getAllItems() resolves all items from 'shopping_list' table", () => {
      //test that ShoppingListService.getAllItems gets data from table
      return ShoppingListService.getAllItems(db).then(actual => {
        expect(actual).to.eql(testItems);
      });
    });
  });

  context("Given 'shopping_list' has no data", () => {
    it("getAllItems() resolves an empty array", () => {
      return ShoppingListService.getAllItems(db).then(actual => {
        expect(actual).to.eql([]);
      });
    });
    it("insertItem() inserts a new item and resolves the new item with an id", () => {
      const newItem = {
        name: "Test new Item",
        price: `1.24`,
        category: "Snack",
        checked: true,
        date_added: new Date("2020-01-01T00:00:00.000Z")
      };
      return ShoppingListService.insertItem(db, newItem).then(actual => {
        expect(actual).to.eql({
          view_id: 1,
          name: newItem.name,
          price: newItem.price,
          category: newItem.category,
          checked: newItem.checked,
          date_added: newItem.date_added
        });
      });
    });
  });
});
