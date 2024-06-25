from mylib.logic import wiki, search_wiki,phrase
from fastapi import FastAPI
import uvicorn

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Wikipedia API. Call/search or /wikiLogic"}


@app.get("/search/{value}")
async def search(value: str):
    """Page to search in wikipedia"""

    data = search_wiki(value)
    return {"result": data}


@app.get("/wiki/{value}")
async def wikiLogic(name: str):
    """Retrieve wikipedia page"""

    result = wiki(name)
    return {"result": result}


@app.get("/phrases/{value}")
async def phrases(name: str):
    """Retrieve wikipedia page adn return phrases"""

    result = phrase(name)
    print("result == ",result)
    return {"result": result}


if __name__ == "__main__":
    uvicorn.run(app, port=8080)
