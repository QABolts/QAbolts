# mongodb_handler.py
from pymongo import MongoClient
from pymongo.errors import ConnectionFailure

class MongoDBHandler:
    def __init__(self, uri, database_name, collection_name):
        try:
            self.client = MongoClient(uri)
            self.db = self.client[database_name]
            self.collection = self.db[collection_name]
            print("Connected to MongoDB")
        except ConnectionFailure as e:
            print(f"Could not connect to MongoDB: {e}")

    def insert_document(self, document):
        try:
            result = self.collection.insert_one(document)
            print(f"Document inserted with _id: {result.inserted_id}")
            return result.inserted_id
        except Exception as e:
            print(f"An error occurred while inserting document: {e}")
            return None

    def update_document(self, filter_query, update_query):
        try:
            result = self.collection.update_one(filter_query, {'$set': update_query})
            if result.matched_count:
                print(f"Document matched and updated: {result.modified_count} document(s) updated.")
            else:
                print("No document matched the filter query.")
            return result.modified_count
        except Exception as e:
            print(f"An error occurred while updating document: {e}")
            return None

    def find_document(self, filter_query):
        try:
            document = self.collection.find_one(filter_query)
            return document
        except Exception as e:
            print(f"An error occurred while finding document: {e}")
            return None
