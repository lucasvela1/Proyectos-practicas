import json


def read_config(key):
    with open("config.json") as file:
        data = json.load(file)
    return data.get(key)
