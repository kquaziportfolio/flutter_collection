from flask import *
import pymongo
app = Flask(__name__)
client = pymongo.MongoClient("mongodb://127.0.0.1")
db = client.mcdonalds
'''
image_links=["https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Chocolate-McCafe-Shake-Medium.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Vanilla-McCafe-Shake-Medium.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Strawberry-McCafe-Shake-Medium.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Vanilla-Reduced-Fat-Ice-Cream-Cone.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Hot-Fudge-Sundae.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-McFlurry-with-MMS-Chocolate-Candies-12floz-cup.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Kiddie-Cone.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Hot-Caramel-Sundae.jpg?"]
    prices=["$3.40",
    "$3.40",
    "$3.40",
    "$3.40",
    "$3.40",
    "$3.40",
    "$3.40",
    "$3.40",]
    names=[
    "Chocalate Shake",
    "Vanilla Shake",
    "Strawberry Shake",
    "Vanilla Cone",
    "Hot Fudge Sundae",
    "McFlurry with M&M'S",
    "Kiddie Cone",
    "Hot Caramel Sundae"
    ]
'''
@app.route('/')
def hello():
    main_stuff=db.mcdonalds.find({})
    links=[]
    prices=[]
    names=[]
    for doc in main_stuff:
        names.append(doc["name"])
        links.append(doc["link"])
        prices.append(doc["price"])
    data=[names,links,prices]
    return jsonify(data)

@app.route("/in",methods=["POST"])
def add_to_list():
    db.mcdonalds.update_one({"name":request.form["name"]}, {"$set": {"name":request.form["name"],"link":request.form["link"],"price":request.form["price"]}}, upsert=True)
    return "inserted"

@app.route("/edit",methods=["POST"])
def edit_item():
    old_name=request.form["old_name"]
    old_link=request.form["old_link"]
    old_price=request.form["old_price"]
    new_name=request.form["new_name"]
    new_link=request.form["new_link"]
    new_price=request.form["new_price"]
    db.mcdonalds.update_one({"name":old_name,"link":old_link,"price":old_price},{"$set":{"name":new_name,"price":new_price,"link":new_link}})
    return "lol"

@app.route("/delete",methods=["POST"])
def delete_item():
    name,link,price=request.form["name"],request.form["link"],request.form["price"]
    db.mcdonalds.delete_one({"name":name,"link":link,"price":price})
    return "lool"

if __name__ == '__main__':
    app.run(host="0.0.0.0",port=80,debug=True)