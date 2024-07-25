# MongoDBLibrary.py
from mongodb_handler import MongoDBHandler

class MongoDBLibrary:
    def __init__(self):
        self.mongodb_handler = None

    def connect_to_mongodb(self, uri, database_name, collection_name):
        self.mongodb_handler = MongoDBHandler(uri, database_name, collection_name)

    def insert_document(self, document):
        return self.mongodb_handler.insert_document(document)

    def update_document(self, filter_query, update_query):
        return self.mongodb_handler.update_document(filter_query, update_query)

    def find_document(self, filter_query):
        return self.mongodb_handler.find_document(filter_query)
